{ config, lib, pkgs, ... }: {
  boot.blacklistedKernelModules = [
    "i2c_nvidia_gpu"
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = false;

    package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.vgpu_17_3;
  };

  boot.initrd.kernelModules = lib.mkBefore [
    "kvm-intel"
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];
}
