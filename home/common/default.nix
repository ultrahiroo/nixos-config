{username, ...}: {
  programs.home-manager.enable = true;
  home = {
    stateVersion = "24.11";
    homeDirectory = "/home/${username}";
  };
}
