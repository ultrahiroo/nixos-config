{ username, pkgs, ... }: {
  imports = [
    ./git.nix

    ../../home/common
    ../../home/btop
    ../../home/gh
    ../../home/git
    ../../home/yash

    ../../home/i3
    ../../home/plasma

    ../../home/brave
    ../../home/chromium
    ../../home/firefox

    ../../home/kate
    ../../home/neovim
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean
      alacritty
      bat
      clang
      eza
      fd
      gg
      gnumake
      ripgrep
      python3
      python3Packages.pip
      python3Packages.virtualenv
      wl-clipboard
      xclip
    ];
  };
}
