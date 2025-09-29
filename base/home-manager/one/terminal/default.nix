{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./foot
    ./ghostty
    ./kitty
    ./konsole
    ./rio
    ./warp
  ];
  home = {
    packages = with pkgs; [
      custom.terminal_emulator
    ];
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
