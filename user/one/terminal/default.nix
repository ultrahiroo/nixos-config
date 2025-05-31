{ pkgs, ... }: {
  imports = [
    ./alacritty
  ];
  home = {
    packages = with pkgs; [
      custom.terminal_emulator
      foot
      kdePackages.konsole
      kitty
      warp-terminal
    ];
  };
  systemd.user.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
