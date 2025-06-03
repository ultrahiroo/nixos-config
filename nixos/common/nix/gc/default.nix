{ pkgs, ... }: {
   imports = [
    ./keep-input.nix
  ];

  nix = {
    settings = {
      keep-outputs = true;
      keep-derivations = true;
      auto-optimise-store = true;
    };
    gc = {
      automatic = false;
      dates = "daily";
      persistent = true;
      options = "--delete-older-than 7d";
    };
  };

  systemd.timers."profile-wipe-history" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "1d";
      Unit = "profile-wipe-history.service";
    };
  };

  systemd.services."profile-wipe-history" = {
    script = ''
      ${pkgs.nix}/bin/nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
