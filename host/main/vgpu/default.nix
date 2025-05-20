{ ... }: {
  hardware.nvidia.vgpu.patcher.enable = true;
  hardware.nvidia.vgpu.patcher.copyVGPUProfiles = {
    "2187:0000" = "1E30:12BA";
  };
  # hardware.nvidia.vgpu.patcher.options.doNotForceGPLLicense = true;
  # hardware.nvidia.vgpu.patcher.options.remapP40ProfilesToV100D = true;
  # hardware.nvidia.vgpu.patcher.options.extra = [
  #   "--spoof-devid"
  # ];
  # hardware.nvidia.vgpu.patcher.profileOverrides = {
  #   "333" = {
  #     vramAllocation = 3584;  # 3.5GiB
  #     heads = 1;
  #     display.width = 1920;
  #     display.height = 1080;
  #     framerateLimit = 60;
  #   };
  # };
  programs.mdevctl.enable = true;
  environment.etc = {
    "libvirt/hooks/qemu".source = ./qemu;
  };
}
