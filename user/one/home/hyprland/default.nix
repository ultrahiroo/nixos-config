{ inputs, pkgs, ... }: {
  home.file = {
    ".config/hypr/hyprland.conf".source = "${inputs.hyprland-config}/hyprland.conf";
    ".config/hypr/plugin.conf".text = ''
      plugin = ${inputs.hy3.packages.${pkgs.system}.hy3}/lib/libhy3.so
      # plugin = ${inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars}/lib/libhyprbars.so
    '';
  };
}
