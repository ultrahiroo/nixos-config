{ ... }: {
  imports = [
    ./sd-image-aarch64.nix
  ];

  formatAttr = "sdImage";
  fileExtension = ".img";
  sdImage = {
    compressImage = false;
  };
}
