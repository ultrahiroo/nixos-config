{ ... }: {
  services.xserver = {
    autoRepeatDelay = 120;
    autoRepeatInterval = 30;
    xkb = {
      layout = "us";
      options = "keypad:pointerkeys";
    };
  };
}
