{ ... }:
{
  boot.kernelParams = [
    "snd_bcm2835.enable_hdmi=0"
    "snd_bcm2835.enable_headphones=1"
  ];
}
