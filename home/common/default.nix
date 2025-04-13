{ username, pkgs, ... }: {
  programs = {
    home-manager = {
      enable = true;
    };
  };
  home = {
    stateVersion = "24.11";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      uv
    ];
  };
}
