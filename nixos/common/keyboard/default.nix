{ ... }: {
  services.xserver = {
    autoRepeatDelay = 180;
    autoRepeatInterval = 30;
    xkb = {
      layout = "us";
      options = "keypad:pointerkeys";
    };
  };
}
