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
  hardware.nvidia.vgpu.patcher.profileOverrides = {
    "1000" = {
      vramAllocation = 3596;  # MiB
      heads = 1;
      enableCuda = true;
      display.width = 1920;
      display.height = 1080;
      framerateLimit = 60;
      xmlConfig = {
        # frl_config = 0;
        frl_enable = 0;
      };
    };
  };
  programs.mdevctl.enable = true;
  # environment.etc = {
  #   "libvirt/hooks/qemu.d/prepare/begin".source = ./qemu.d/prepare/begin;
  #   "libvirt/hooks/qemu.d/release/end".source = ./qemu.d/release/end;
  # };
}
