{ ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../arch/x86_64-linux
    ./binfmt
    ./boot
    ./btrfs
    ./filesystem
    # ./gpu-passthrough
    ./networking
    ./iommu
    ./nvidia
    ./home-manager
    ./obs-studio
    ./spotify
    ./swap
    # ./vgpu
  ];
}
