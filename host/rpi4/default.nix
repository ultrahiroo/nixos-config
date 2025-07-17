{ inputs, lib, pkgs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ../../arch/aarch64-linux
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
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=ttyAMA0,115200n8"
      "console=tty0"
    ];
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
  };

  hardware = {
    raspberry-pi."4" = {
      apply-overlays-dtmerge = {
        enable = true;
      };
      bluetooth = {
        enable = false;
      };
    };
    deviceTree = {
      enable = true;
      filter = lib.mkForce "bcm2711-rpi-4-b.dtb";
      overlays = [
        {
          name = "disable-wifi";
          dtboFile = "${pkgs.raspberrypifw}/share/raspberrypi/boot/overlays/disable-wifi.dtbo";
        }
        {
          name = "disable-bt";
          dtboFile = "${pkgs.raspberrypifw}/share/raspberrypi/boot/overlays/disable-bt.dtbo";
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4 * 1024;  # MiB
    }
  ];
}
