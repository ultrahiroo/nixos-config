{ pkgs, ... }:
{
  xdg = {
    configFile = {
      "niri" = {
        source = ./niri;
        force = true;
      };
    };
  };
  home.packages = with pkgs; [
    mako
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
    quickshell
    xwayland-satellite
    waybar
    # (pkgs.writeScriptBin "focus-window" (builtins.readFile ./bin/focus-window.fish))
    # (pkgs.writeScriptBin "sort-windows" (builtins.readFile ./binsort-windows.fish))
    # (pkgs.writeScriptBin "wait-window" (builtins.readFile ./bin/wait-window.fish))
  ];
}
