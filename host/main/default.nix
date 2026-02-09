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
    ./home-manager
    ./iommu
    ./mumble
    ./networking
    ./nvidia
    ./obs-studio
    ./secrets
    ./server
    ./spotify
    ./steam
    ./swap
    # ./vgpu
    ./virtualbox
    ./wine
  ];
}
