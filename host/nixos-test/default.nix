{ config, pkgs, ... }: {
  imports = [
    ../common
    ./hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      efiSupport = false;
      useOSProber = true;
    };
  };

  networking = {
    hostName = "nixos-test";
  };
}
