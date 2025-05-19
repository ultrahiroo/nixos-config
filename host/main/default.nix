{ config, pkgs, ... }: {
  imports = [
    ../common
    ./hardware-configuration.nix
    ./nvidia.nix
    ./gpu-passthrough
    ./vgpu
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "main";
  };
}
