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
      gnused
      grip-grab

      clang-tools
      lua-language-server
      nil
      nixd
      nixfmt-rfc-style
      pyright
      typescript-language-server
    ];
  };
}
