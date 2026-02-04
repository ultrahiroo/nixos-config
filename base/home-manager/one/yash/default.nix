{ config, ... }:
{
  home.file = {
    ".profile".text = ''
      if test "''${__HM_SESS_VARS_SOURCED:=NotFound}" == 'NotFound'; then
        export __HM_SESS_VARS_SOURCED=""
      fi
      . "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"
    '';
    ".yashrc".source = ./yashrc;
    ".config/yash/initialization/common".source = ./yash/initialization/common;
    ".config/yash/alias.sh".source = ./yash/alias.sh;
    ".config/yash/export.sh".source = ./yash/export.sh;
    ".config/yash/function.sh".source = ./yash/function.sh;
    ".config/yash/prompt.sh".source = ./yash/prompt.sh;
  };
}
