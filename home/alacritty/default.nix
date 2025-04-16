{ inputs, ... }: {
  home.file = {
    ".config/alacritty".source = inputs.alacritty-config;
  };
}
