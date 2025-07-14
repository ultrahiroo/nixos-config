{ inputs, pkgs, ... }: let
  x = [
    {
      number = "1";
      alias_key = "L";
      name = "BTOP";
      command = "alacritty --title BTOP --class BTOP --command btop";
    }
    {
      number = "2";
      alias_key = "N";
      name = "FireFox";
      command = "firefox";
    }
    {
      number = "3";
      alias_key = "U";
      name = "Alacritty";
      command = "alacritty";
    }
  ];

  lib = (import ./lib.nix) { pkgs = pkgs; };
  maomao_spawn_config = lib.get_maomao_spawn_config x;

  waybar_label = lib.get_waybar_label x;
  waybar_config = builtins.fromJSON (builtins.readFile "${./waybar/config}");
  additional_waybar_config."dwl/tags"."tag-labels" = waybar_label;
  mergeList = inputs.merge-list.lib.mergeList;
  new_waybar_config = mergeList [waybar_config additional_waybar_config];
  new_waybar_config_file = pkgs.writeText "new_waybar_config" (builtins.toJSON new_waybar_config);
in {
  imports = [
    inputs.maomaowm.hmModules.maomaowm
  ];
  wayland.windowManager.maomaowm = {
    enable = true;
    settings = (
      (builtins.readFile ./maomao/config.conf)
      + maomao_spawn_config
    );
    autostart_sh = (builtins.readFile ./maomao/autostart.sh) + ''
      swaybg -i ${../wallpaper/wallpaper.jpg} &
      waybar -c ${new_waybar_config_file} -s ${./waybar/style.css} &
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
