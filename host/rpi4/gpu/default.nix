{ pkgs, ... }: {
  hardware.graphics.enable32Bit = false;

  hardware = {
    # raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # deviceTree = {
    #   enable = true;
    #   filter = "*rpi-4-*.dtb";
    # };
    raspberry-pi."4".fkms-3d = {
      enable = true;
      cma = 512;
    };
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    nvtopPackages.v3d
  ];
}
