{ pkgs, ... }:
{
  xdg.configFile."alacritty" = {
    source = ./alacritty;
    force = true;
  };
  home.packages = with pkgs; [
    alacritty
  ];
}
