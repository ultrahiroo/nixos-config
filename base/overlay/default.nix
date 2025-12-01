{ inputs, ... }:
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
          terminal_emulator = inputs.terminal_emulator.packages.${system}.default;
        };
        firefox-addons = inputs.firefox-addons.packages.${system};
      }
    )
  ];
}
