{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./waybar
  ];
  home = {
    file = {
      ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".config/hypr/plugin.conf".text = ''
        plugin = ${inputs.hy3.packages.${system}.hy3}/lib/libhy3.so
        # plugin = ${inputs.hyprland-plugins.packages.${system}.hyprbars}/lib/libhyprbars.so
        plugin = ${inputs.hyprland-plugins.packages.${system}.hyprwinwrap}/lib/libhyprwinwrap.so
      '';
      ".config/hypr/hyprpaper.conf".text = ''
        preload = ${../wallpaper/wallpaper.jpg}
        wallpaper = , ${../wallpaper/wallpaper.jpg}
      '';
    };
    packages = with pkgs; [
      hyprpaper
      nwg-drawer
      waybar
    ];
  };
}
