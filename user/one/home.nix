{ username, pkgs, ... }: {
  imports = [
    ./git.nix

    ../../home/common
    ../../home/btop
    ../../home/gh
    ../../home/git
    ../../home/ripgrep
    ../../home/yash

    ../../home/i3
    ../../home/plasma

    ../../home/brave
    ../../home/chromium
    ../../home/firefox

    ../../home/kate
  ];
  home = {
    packages = with pkgs; [
      clangStdenv
      eza
      fd
      python3
      python3Packages.pip
      python3Packages.virtualenv
    ];
  };
}
