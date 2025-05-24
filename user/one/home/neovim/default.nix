{ inputs, pkgs, ... }: {
  programs.neovim = {
    enable = true;
  };
  home.file = {
    ".config/nvim".source = inputs.neovim-config;
  };
  home = {
    packages = with pkgs; [
      grip-grab
    ];
  };
}
