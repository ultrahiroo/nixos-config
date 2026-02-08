{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (
      final: prev:
      let
        system = prev.stdenv.hostPlatform.system;
      in
      {
        custom = {
          clean = inputs.clean.packages.${system}.default;
          codon = inputs.codon.packages.${system}.default;
          terminal = inputs.terminal.packages.${system}.default;
        };
        firefox-addons = inputs.firefox-addons.packages.${system};
        spotify-adblock = pkgs.callPackage ./spotify-adblock { };
      }
    )
  ];
}
