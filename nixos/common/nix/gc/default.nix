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
      automatic = true;
      dates = "daily";
      persistent = true;
      options = "--delete-older-than 7d";
    };
  };

  # systemd.timers."nix-store-gc" = {
  #   wantedBy = [ "timers.target" ];
  #   timerConfig = {
  #     OnBootSec = "5m";
  #     OnUnitActiveSec = "1d";
  #     Unit = "nix-store-gc.service";
  #   };
  # };

  # systemd.services."nix-store-gc" = {
  #   script = ''
  #     ${pkgs.nix}bin/nix store gc --delete-older-than 7d
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "root";
  #   };
  # };
}
