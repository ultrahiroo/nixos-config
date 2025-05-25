{ ... }: {
  home.file = {
    ".config/kdedefaults/kdeglobals".source = ./kdedefaults/kdeglobals;
    ".config/kcminputrc".source = ./kcminputrc;
    ".config/kscreenlockerrc".source = ./kscreenlockerrc;
    ".config/kxkbrc".source = ./kxkbrc;
    ".config/powerdevilrc".source = ./powerdevilrc;
  };
}
