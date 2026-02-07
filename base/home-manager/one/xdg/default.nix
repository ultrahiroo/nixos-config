{ config, ... }:
let
  home = "${config.home.homeDirectory}";
in
{
  xdg = {
    enable = true;
    cacheHome = "${home}/.cache";
    configHome = "${home}/.config";
    dataHome = "${home}/.local/share";
    stateHome = "${home}/.local/state";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${home}/Desktop";
      documents = "${home}/Documents";
      download = "${home}/Downloads";
      music = "${home}/Music";
      pictures = "${home}/Pictures";
      publicShare = "${home}/Public";
      templates = "${home}/Templates";
      videos = "${home}/Videos";
      extraConfig = {
        XDG_MISC_DIR = "${home}/Misc";
        XDG_GAMES_DIR = "${home}/Games";
      };
    };
  };
}
