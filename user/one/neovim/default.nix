{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
  };
  home.file = {
    ".config/nvim/init.lua".source = ./nvim/init.lua;
    ".config/nvim/lua" = { source = ./nvim/lua; recursive = true; };
  };
  home = {
    packages = with pkgs; [
      grip-grab

      clang-tools
      lua-language-server
      nil
      pyright
    ];
  };
}
