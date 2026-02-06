{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };
  xdg.cacheFile."nvim/plugin/nvim-treesitter" = {
    source = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  };
  xdg.configFile."nvim" = {
    source = ./nvim;
    force = true;
  };
  home.packages = with pkgs; [
    gnused
    grip-grab

    clang-tools
    kdePackages.qtdeclarative # qmlls
    lua-language-server
    nil
    nixd
    nixfmt-rfc-style
    pyrefly
    pyright
    typescript-language-server
  ];
}
