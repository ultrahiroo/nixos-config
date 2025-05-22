{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./boot
    ./filesystem
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
