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
  systemd.user.sessionVariables = {
    EDITOR   = "nvim";
  };
}
