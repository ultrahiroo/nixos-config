{ ... }:
{
  imports = [
    ./kate
    ./micro
    ./neovim
    ./vscode
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
