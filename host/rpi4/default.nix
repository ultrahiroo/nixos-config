{ ... }: {
  hardware.graphics.enable32Bit = false;

  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];

  # fileSystems = {
  #   "/" = {
  #     device = "/dev/disk/by-label/NIXOS_SD";
  #     fsType = "btrfs";
  #     options = [
  #       "subvol=@"
  #     ];
  #   };
  # };
}
