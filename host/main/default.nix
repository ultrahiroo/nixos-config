{ ... }: {
  imports = [
    ../../arch/x86_64
    ./hardware-configuration.nix
    ./boot
    ./filesystem
    ./btrfs
    ./networking
    ./iommu
    ./nvidia

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
