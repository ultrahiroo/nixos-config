{ inputs, pkgs, ... }: {
  imports = [
    inputs.maomaowm.nixosModules.maomaowm
  ];
  programs.maomaowm.enable = pkgs.stdenv.isx86_64;
}
