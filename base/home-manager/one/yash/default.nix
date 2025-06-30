{ ... }: {
  home.file = {
    ".yashrc".source = ./yashrc;
    ".config/yash/initialization/common".source = ./yash/initialization/common;
    ".config/yash/alias.sh".source = ./yash/alias.sh;
    ".config/yash/export.sh".source = ./yash/export.sh;
    ".config/yash/function.sh".source = ./yash/function.sh;
    ".config/yash/home-manager.sh".source = ./yash/home-manager.sh;
    ".config/yash/prompt.sh".source = ./yash/prompt.sh;
  };
}
