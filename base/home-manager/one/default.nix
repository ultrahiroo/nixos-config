{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./antigravity
    ./audio
    ./bash
    ./bat
    ./brave
    ./bottles
    ./browser
    ./btop
    ./chromium
    ./editor
    ./firefox
    ./foot
    ./fossil
    ./gh
    ./ghostty
    ./git
    ./kate
    ./kitty
    ./konsole
    ./linux-pam
    ./mangowc
    ./micro
    ./neovim
    ./niri
    ./plasma
    ./rio
    ./ssh
    ./starship
    ./terminal
    ./vscode
    ./warp
    ./wezterm
    ./xdg
    ./yash
  ];
  home.packages = with pkgs; [
    toybox

    bcachefs-tools
    btrfs-progs
    e2fsprogs
    xfsprogs

    compsize

    cloc
    scc

    droidcam

    gnirehtet # Reverse tethering over adb for Android

    appimage-run
    baobab
    blender
    cargo
    curl
    custom.clean
    devenv
    disko
    eza
    fd
    file
    gimp3
    gptfdisk
    hdparm
    neofetch
    nixfmt-tree
    kdePackages.discover
    kdePackages.filelight
    kdePackages.kdeconnect-kde
    kdePackages.kdenlive
    ripgrep
    rofi
    shotcut
    tmux
    unixtools.quota
    unrar
    unzip
    vlc
    wget
    xclip

    # gnumake
    # meson
    nodejs
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # heroic
    # lutris
    mangohud
    # rare
    protonplus

    ardour
    reaper
    rosegarden

    seahorse
    kdePackages.kleopatra
  ];
}
