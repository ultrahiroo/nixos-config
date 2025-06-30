{ pkgs, ... }: {
  imports = [
    ./kate
    ./neovim
 ];
  home = {
    packages = with pkgs; [
      kdePackages.kate
      micro
      vscode
    ];
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
