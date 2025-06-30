{ inputs, lib, ... }:
{
  imports = [
    inputs.nixos-generators.nixosModules.all-formats
  ];
  formatConfigs.virtualbox =
    { ... }:
    {
      virtualisation.virtualbox.guest = {
        enable = true;
        dragAndDrop = true;
      };
    };
  formatConfigs.sd-aarch64 =
    { ... }:
    {
      fileExtension = lib.mkForce ".img";
      sdImage = {
        compressImage = false;
      };
    };
  formatConfigs.sd-aarch64-btrfs = (import ./sd-aarch64-btrfs);
}
