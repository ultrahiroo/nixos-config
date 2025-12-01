{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${system};
in
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics = {
    package = hyprland-pkgs.mesa;
    package32 = hyprland-pkgs.pkgsi686Linux.mesa;
  };
  environment.sessionVariables = {
    HYPRLAND_PLUGIN_HY3 = "${inputs.hy3.packages.${system}.hy3}/lib/libhy3.so";
    HYPRLAND_PLUGIN_HYPRBARS = "${
      inputs.hyprland-plugins.packages.${system}.hyprbars
    }/lib/libhyprbars.so";
  };
}
