{ pkgs, ... }: {
  imports = [
    ./kate
    ./neovim
 ];
  home = {
    packages = with pkgs; [
      kdePackages.kate
      vscode
    ];
  };
  home.sessionVariables = {
    EDITOR   = "nvim";
  };
}
