{ pkgs, ... }: {
  systemd.timers."btrfs-balance" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "1d";
      Unit = "btrfs-balance.service";
    };
  };

  systemd.services."btrfs-balance" = {
    script = ''
      ${pkgs.btrfs-progs}/bin/btrfs balance start -dusage=10 /
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
