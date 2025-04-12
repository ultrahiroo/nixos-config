{ pkgs, ... }: {
  environment.pathsToLink = ["/libexec"];
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      runXdgAutostartIfNone = true;
    };

    displayManager = {
      lightdm.enable = false;
      gdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        dunst
        i3blocks
        i3lock
        xautolock
        i3status
        i3-gaps
        picom
        feh
        acpi
        arandr
        dex
        xbindkeys
        xorg.xbacklight
        xorg.xdpyinfo
        sysstat
      ];
    };
  };

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
