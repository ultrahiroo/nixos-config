{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };
  home = {
    file = {
      ".config/nvim" = {
        source = ./nvim;
        force = true;
      };
    };
    packages = with pkgs; [
      gnused
      grip-grab

      clang-tools
      lua-language-server
      nil
      nixd
      nixfmt-rfc-style
      pyrefly
      pyright
      typescript-language-server
    ];
  };
}
