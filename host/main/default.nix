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
  ];
}
