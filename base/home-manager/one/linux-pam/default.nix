{ pkgs, ... }:
{
  home = {
    sessionVariables = {
      LINUX_PAM_PATH = "${pkgs.linux-pam}";
    };
    packages = with pkgs; [
      linux-pam
    ];
  };
}
