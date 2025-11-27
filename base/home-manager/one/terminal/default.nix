{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      custom.terminal_emulator
    ];
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
