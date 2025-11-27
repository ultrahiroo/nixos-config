{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      alacritty
    ];
    file = {
      ".config/alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
    };
  };
}
