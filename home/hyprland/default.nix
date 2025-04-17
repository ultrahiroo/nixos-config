{ inputs, ... }: {
  home.file = {
    ".config/hypr".source = inputs.hyprland-config;
  };
}
