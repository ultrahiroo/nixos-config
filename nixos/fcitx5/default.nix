{ config, pkgs, ... }: {
   i18n.inputMethod = {
     type = "fcitx5";
     enable = true;
     fcitx5.addons = with pkgs; [
       fcitx5-mozc
       fcitx5-gtk
       fcitx5-configtool
       fcitx5-with-addons
       fcitx5-nord
       kdePackages.fcitx5-qt
     ];
     fcitx5.waylandFrontend = true;
   };
}
