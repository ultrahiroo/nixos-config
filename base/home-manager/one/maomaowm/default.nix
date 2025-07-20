{ inputs, pkgs, ... }: let
  x = [
    {
      number = "1";
      alias_key = "L";
      name = "BTOP";
      command = ''
        alacritty --title BTOP --class TOP --command btop &
        sleep 1
        alacritty --title NVTOP --class TOP --command nvtop &
      '';
      appid = "TOP";
      title = ".*";
    }
    {
      number = "2";
      alias_key = "N";
      name = "Alacritty";
      command = ''
        alacritty &
      '';
      appid = "Alacritty";
      title = ".*";
    }
    {
      number = "3";
      alias_key = "U";
      name = "FireFox";
      command = ''
        firefox &
      '';
      appid = "firefox";
      title = ".*";
    }
    {
      number = "4";
      alias_key = "E";
      name = "Steam";
      command = ''
        steam &
      '';
      appid = "steam.*";
      title = ".*";
    }
    {
      number = "5";
      alias_key = "Y";
      name = "OBS";
      command = ''
        obs &
      '';
      appid = "com.obsproject.Studio";
      title = ".*";
    }
    {
      number = "6";
      alias_key = "I";
      name = "Discord";
      command = ''
        discord &
      '';
      appid = "discord";
      title = ".*";
    }
    {
      number = "7";
      alias_key = "O";
      name = "Spotify";
      command = ''
        # chromium-browser --kiosk https://open.spotify.com &
      '';
      # appid = "Spotify";
      # title = "Spotify";
      appid = "Chromium-browser";
      title = "Spotify.*";
    }
    {
      number = "8";
      alias_key = "K";
      name = "Youtube";
      command = ''
        # chromium-browser --kiosk https://youtube.com &
      '';
      appid = "Chromium-browser";
      title = "Youtube.*";
    }
    {
      number = "9";
      alias_key = "M";
      name = "Empty";
      command = ''
      '';
      appid = "(?!.*)";
      title = ".*";
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
      + "\n"
      + maomao_spawn_config
    );
    autostart_sh = (builtins.readFile ./maomao/autostart.sh) + ''
      swaybg -i ${../wallpaper/wallpaper.jpg} &
      waybar -c ${new_waybar_config_file} -s ${./waybar/style.css} &
    '';
  };
  home = {
    file = {
      ".config/maomaowm/waybar/config".source = "${new_waybar_config_file}";
      ".config/maomaowm/waybar/style.css".source = "${./waybar/style.css}";
    };
    packages = with pkgs; [
      dpms-off
      mmsg
      pamixer
      rofi
      swaybg
      swaynotificationcenter
      waybar
      wlsunset
      wlogout
      wlr-randr
      wl-clipboard
      wl-clip-persist
    ];
  };
}
