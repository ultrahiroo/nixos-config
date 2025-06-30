{ inputs, pkgs, ... }: {
  home = {
    file = {
      ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".config/hypr/plugin.conf".text = ''
        plugin = ${inputs.hy3.packages.${pkgs.system}.hy3}/lib/libhy3.so
        # plugin = ${inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars}/lib/libhyprbars.so
        plugin = ${inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap}/lib/libhyprwinwrap.so
      '';
      ".config/hypr/hyprpaper.conf".text = ''
        preload = ${../wallpaper/wallpaper.jpg}
        wallpaper = , ${../wallpaper/wallpaper.jpg}
      '';
    };
    packages = with pkgs; [
      hyprpaper
    ];
  };
}
