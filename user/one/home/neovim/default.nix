{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
  };
  home.file = {
    ".config/nvim/lua".source = ./nvim/lua;
    ".config/nvim/init.lua".source = ./nvim/init.lua;
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
