{ inputs, pkgs, ... }: {
  imports = [
    inputs.maomaowm.hmModules.maomaowm
  ];
  wayland.windowManager.maomaowm = {
    enable = pkgs.stdenv.isx86_64;
    settings = (builtins.readFile ./maomao/config.conf);
    autostart_sh = (builtins.readFile ./maomao/autostart.sh) + ''
      swaybg -i ${../wallpaper/wallpaper.jpg} &
      waybar -c ${./waybar/config} -s ${./waybar/style.css} &
    '';
  };
  home = {
    packages = with pkgs; [
      mmsg
      rofi
      swaynotificationcenter
      waybar
      wlsunset
      wl-clipboard
      wl-clip-persist
      xdg-desktop-portal-wlr
    ];
  };
}
