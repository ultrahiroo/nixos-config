{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./boot
    ./btrfs
    ./networking
    ./nvidia
    ./iommu

    # ./gpu-passthrough
    # ./vgpu
  ];
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "x86_64-windows"
  ];
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;  # MiB
    }
  ];
}
