{ ... }: {
  imports = [
    ../common
    ./hardware-configuration.nix
    ./filesystem
    ./nvidia.nix
    ./iommu

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
