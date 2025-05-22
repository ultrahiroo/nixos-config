{ config, pkgs, ... }: {
   i18n.inputMethod = {
     enable = true;
     type = "fcitx5";
     fcitx5 = {
       addons = with pkgs; [
         fcitx5-mozc
         fcitx5-gtk
         fcitx5-configtool
         fcitx5-with-addons
         fcitx5-nord
         kdePackages.fcitx5-qt
       ];
       waylandFrontend = true;
       plasma6Support = true;
     };
   };
}
