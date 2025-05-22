{ pkgs, inputs, ... }: let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.system};
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics = {
    package = hyprland-pkgs.mesa;
    package32 = hyprland-pkgs.pkgsi686Linux.mesa;
  };
  environment.sessionVariables = {
    HYPRLAND_PLUGIN_HY3 = "${inputs.hy3.packages.${pkgs.system}.hy3}/lib/libhy3.so";
    HYPRLAND_PLUGIN_HYPRBARS = "${inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars}/lib/libhyprbars.so";
  };
}
