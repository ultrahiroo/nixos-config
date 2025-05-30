{ pkgs, ... }: {
  hardware.graphics.enable32Bit = false;

  hardware = {
    raspberry-pi."4".fkms-3d = {
      enable = true;
      cma = 512;
    };
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.v3d
  ];
}
