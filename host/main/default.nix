{ config, ... }: {
  imports = [
    ../common
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "main";
    wireless.enable = false;
    networkmanager.enable = true;
  };

  # For NVidia GPU
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
