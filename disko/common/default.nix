{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  enable_compression = false;
in
{
  imports = [
    inputs.disko.nixosModules.disko
    ./make-disk-image.nix
  ];
  disko = {
    memSize = 8 * 1024;
    imageBuilder = {
      enableBinfmt = true;
      qemu = (
        (import pkgs.path { system = "x86_64-linux"; }).qemu
        + "/bin/qemu-system-aarch64"
        + " -M virt"
        + " -cpu cortex-a72"
      );
      kernelPackages = pkgs.linuxPackages_latest;
      extraPostVM = lib.optionalString enable_compression ''
        ${pkgs.zstd}/bin/zstd --compress $out/*raw
        rm $out/*raw
      '';
    };
  };
}
