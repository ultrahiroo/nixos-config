{ ... }: {
  # error: The option `home-manager.users.one.programs.yash' does not exist.
  home.file = {
    ".yashrc".source = ./yashrc;
    ".config/yash/initialization/common".source = ./initialization/common;
    ".config/yash/alias.sh".source = ./alias.sh;
    ".config/yash/export.sh".source = ./export.sh;
    ".config/yash/function.sh".source = ./function.sh;
    ".config/yash/prompt.sh".source = ./prompt.sh;
  };
}
