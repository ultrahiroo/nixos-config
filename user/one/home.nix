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
    ../../home/hyprland

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
      cmake
      # codon
      curl
      eza
      fd
      gg
      gnumake
      meson
      neofetch
      kdePackages.kate
      ripgrep
      python3
      python3Packages.pip
      python3Packages.virtualenv
      vscode
      wget
      wl-clipboard
      xclip
      yash

      bottles
      gamescope
      heroic
      lutris
      mangohud
      protonup
    ];
  };
}
