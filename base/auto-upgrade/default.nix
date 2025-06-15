{ pkgs, ... }:
{
  systemd.timers."auto-upgrade" = {
    wantedBy = [
      "timers.target"
    ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "1d";
      Unit = "auto-upgrade.service";
    };
  };
  systemd.services."auto-upgrade" = {
    script = ''
      set -ex

      HOSTNAME=$(${pkgs.hostname}/bin/hostname)

      cd /var/lib/
      if test ! -d nixos-config/; then
          ${pkgs.git}/bin/git clone https://github.com/ultrahiroo/nixos-config --depth=1
      fi
      cd nixos-config/
      ${pkgs.git}/bin/git pull
      ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch \
          --flake .#$HOSTNAME \
          --option sandbox false \
          --print-build-logs \
          --log-format raw
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
