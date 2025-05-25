{ pkgs, ... }: {
  hardware.graphics.enable32Bit = false;

  environment.systemPackages = with pkgs; [
    nvtopPackages.v3d
  ];
}
