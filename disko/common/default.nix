{ inputs, pkgs, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
    ./make-disk-image.nix
  ];
  disko = {
    memSize = 6 * 1024;
    imageBuilder = {
      enableBinfmt = true;
      qemu = (
        (import pkgs.path { system = "x86_64-linux"; }).qemu
        + "/bin/qemu-system-aarch64 -M virt -cpu cortex-a57"
      );
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
