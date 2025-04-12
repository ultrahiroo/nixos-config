{ username, ... }: {
  imports = [
    ./git.nix

    ../../home/common
    ../../home/git
    ../../home/btop
    ../../home/ripgrep

    ../../home/i3
    ../../home/plasma

    ../../home/brave
    ../../home/chromium
    ../../home/firefox
  ];
}
