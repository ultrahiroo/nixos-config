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
  home = {
    packages = with pkgs; [
      gnome-keyring
      mako
      quickshell
      swaybg
      waybar
      wl-clipboard
      wl-clip-persist
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xwayland-satellite
      # (pkgs.writeScriptBin "focus-window" (builtins.readFile ./bin/focus-window.fish))
      # (pkgs.writeScriptBin "sort-windows" (builtins.readFile ./binsort-windows.fish))
      # (pkgs.writeScriptBin "wait-window" (builtins.readFile ./bin/wait-window.fish))
    ];
  };
}
