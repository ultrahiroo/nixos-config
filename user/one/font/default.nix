{ inputs, ... }: {
  home.file = {
    ".local/share/fonts".source = inputs.font-data;
  };
}
