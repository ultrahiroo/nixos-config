{ username, pkgs, ... }: {
  imports = [
    ./git.nix

    ../../home/common
    ../../home/btop
    ../../home/gh
    ../../home/git
    ../../home/yash
    ../../home/font

    ../../home/i3
    ../../home/plasma

    ../../home/brave
    ../../home/chromium
    ../../home/firefox

    ../../home/kate
    ../../home/neovim

    ../../home/alacritty
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean
      alacritty
      bat
      clang
      curl
      eza
      fd
      gg
      gnumake
      neofetch
      kdePackages.kate
      ripgrep
      python3
      python3Packages.pip
      python3Packages.virtualenv
      wget
      wl-clipboard
      xclip
    ];
  };
}
