{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      custom.terminal
    ];
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
