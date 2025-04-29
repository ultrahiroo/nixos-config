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

    # ../../home/caddy
    ../../home/mydns
    ../../home/wireproxy
    ../../home/web_server
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean
      alacritty
      baobab
      bat
      caddy
      clang
      cmake
      cpu-x
      curl
      devenv
      eza
      fd
      gg
      gnumake
      meson
      neofetch
      nodejs_23
      nvtopPackages.full
      kdePackages.filelight
      kdePackages.kate
      ripgrep
      python3
      python3Packages.pip
      python3Packages.virtualenv
      scc
      tmux
      unixtools.quota
      vscode
      wget
      wireproxy
      wl-clipboard
      xclip
      yash

      bottles
      # heroic
      # lutris
      mangohud
      protonup-qt
      # rare
    ];
  };
}
