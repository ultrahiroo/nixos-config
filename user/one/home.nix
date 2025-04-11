{ username, ... }: {
  imports = [
    ./git.nix

    ../../home/common
    ../../home/git
    # ../../home/i3
    ../../home/chromium
    ../../home/firefox
    ../../home/btop
    ../../home/ripgrep
  ];
}
