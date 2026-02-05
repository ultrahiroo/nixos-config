{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = [
    inputs.antigravity-nix.packages.${system}.default
  ];
}
