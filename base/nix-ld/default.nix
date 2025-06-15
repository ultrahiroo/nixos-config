{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      fusePackages.fuse_2 # custom.davinci-resolve
    ];
  };
}
