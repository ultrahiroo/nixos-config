{ pkgs, inputs, ... }: let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics = {
    enable32Bit = true;
    package = hyprland-pkgs.mesa;
    package32 = hyprland-pkgs.pkgsi686Linux.mesa;
  };
}
