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
    ../../home/neovim
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean
      bat
      clang
      eza
      fd
      gnumake
      python3
      python3Packages.pip
      python3Packages.virtualenv
    ];
  };
}
