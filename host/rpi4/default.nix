{ lib, ... }: {
  imports = [
    ./audio
    ./gpu
    ./networking
  ];

  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    consoleLogLevel = 7;
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=ttyAMA0,115200n8"
      "console=tty0"
    ];
  };

  hardware = {
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = lib.mkForce "bcm2711-rpi-4-b.dtb";
    };
  };

  hardware = {
    raspberry-pi."4".bluetooth = {
      enable = false;
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4 * 1024;  # MiB
    }
  ];
}
