{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./antigravity
    ./bat
    ./brave
    ./bottles
    ./browser
    ./btop
    ./chromium
    ./editor
    ./firefox
    ./foot
    ./gh
    ./ghostty
    ./git
    ./hyprland
    ./i3
    ./kate
    ./kitty
    ./konsole
    ./linux-pam
    ./mango
    ./micro
    ./mydns
    ./neovim
    ./niri
    ./plasma
    ./quickshell
    ./rio
    ./terminal
    ./vscode
    ./warp
    ./web_server
    ./xdg
    ./yash
  ];

  home = {
    packages = with pkgs; [
      toybox

      bcachefs-tools
      btrfs-progs
      e2fsprogs
      xfsprogs

      compsize

      cloc
      scc

      droidcam
      qpwgraph
      pavucontrol
      qjackctl

      gnirehtet

      appimage-run
      baobab
      bat
      blender
      cargo
      curl
      custom.clean
      # devenv
      disko
      eza
      fd
      file
      gimp3
      gnumake
      gptfdisk
      meson
      neofetch
      nixfmt-tree
      nodejs
      kdePackages.discover
      kdePackages.filelight
      kdePackages.kdeconnect-kde
      kdePackages.kdenlive
      python3
      python3Packages.pip
      python3Packages.virtualenv
      ripgrep
      rofi
      shotcut
      tmux
      unixtools.quota
      unrar
      unzip
      vlc
      wget
      wireproxy
      wl-clipboard
      xclip
      yash

      # heroic
      # lutris
      mangohud
      # rare
    ];
  };
}
