{ pkgs, ... }: {
  programs.maomaowm.enable = pkgs.stdenv.isx86_64;
}
