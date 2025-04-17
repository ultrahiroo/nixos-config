{ inputs, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      inputs.hy3.packages.${pkgs.system}.hy3
    ];
  };
  home.file = {
    ".config/hypr".source = inputs.hyprland-config;
  };
}
