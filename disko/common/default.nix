{ inputs, ... }:
{
  imports = [ inputs.disko.nixosModules.disko ];
  disko = {
    imageBuilder = {
      enableBinfmt = true;
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      kernelPackages = inputs.nixpkgs.legacyPackages.x86_64-linux.linuxPackages_latest;
      copyNixStoreThreads = 8;
    };
    memSize = 8 * 1024;
  };
}
