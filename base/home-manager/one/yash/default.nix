{ config, ... }:
{
  xdg.configFile."yash" = {
    source = ./yash;
    force = true;
  };
  home.file = {
    ".yashrc".text = ''
      if test "''${__HM_SESS_VARS_SOURCED:=NotFound}" == 'NotFound'; then
        export __HM_SESS_VARS_SOURCED=""
      fi
      . "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"

      . "${config.xdg.configHome}/yash/main.sh"
    '';
  };
}
