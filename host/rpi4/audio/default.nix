{ ... }: {
  hardware = {
    raspberry-pi."4".audio = {
      enable = true;
    };
  };
  boot.kernelParams = [
    "snd_bcm2835.enable_hdmi=1"
    "snd_bcm2835.enable_headphones=1"
  ];
}
