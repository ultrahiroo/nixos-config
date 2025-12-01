{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-mozc-ut
        fcitx5-gtk
        fcitx5-nord
        kdePackages.fcitx5-configtool
        kdePackages.fcitx5-qt
        kdePackages.fcitx5-with-addons
      ];
      waylandFrontend = true;
    };
  };
}
