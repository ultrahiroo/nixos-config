{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      custom = {
        clean = inputs.clean.packages.${prev.system}.default;
        codon = inputs.codon.packages.${prev.system}.default;
        terminal_emulator = inputs.terminal_emulator.packages.${prev.system}.default;
      };
      firefox-addons = inputs.firefox-addons.packages.${prev.system};
    })
  ];
}
