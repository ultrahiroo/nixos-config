{ ... }:
{
  home.file = {
    ".config/kdedefaults/kdeglobals".source = ./kdedefaults/kdeglobals;
    ".config/kcminputrc".source = ./kcminputrc;
    ".config/kscreenlockerrc".source = ./kscreenlockerrc;
    ".config/kxkbrc" = {
      source = ./kxkbrc;
      force = true;
    };
    ".config/powerdevilrc".source = ./powerdevilrc;
  };
}
