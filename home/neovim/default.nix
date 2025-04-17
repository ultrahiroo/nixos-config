{ inputs, ... }: {
  programs.neovim = {
    enable = true;
  };
  home.file = {
    ".config/nvim".source = inputs.neovim-config;
  };
}
