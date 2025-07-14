{ ... }: {
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.picom.enable = true;
}
