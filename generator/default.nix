{ inputs, lib, ... }: {
  imports = [
    inputs.nixos-generators.nixosModules.all-formats
  ];
  formatConfigs.virtualbox = { ... }: {
    virtualisation.virtualbox.guest = {
      enable = true;
      dragAndDrop = true;
    };
  };
  formatConfigs.sd-aarch64 = { ... }: {
    fileExtension = lib.mkForce ".img";
    sdImage = {
      compressImage = false;
    };
  };
  formatConfigs.rpi4-btrfs = (import ./rpi4-btrfs);
}
