{ nixos_version, ... }: {
  programs = {
    home-manager = {
      enable = true;
    };
  };
  home = {
    stateVersion = nixos_version;
  };
}
