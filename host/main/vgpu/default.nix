{ inputs, pkgs, ... }: {
  imports = [
    inputs.vgpu4nixos.nixosModules.host
  ];
  hardware.nvidia.vgpu.patcher.enable = true;
  hardware.nvidia.vgpu.patcher.copyVGPUProfiles = {
    "2187:0000" = "1E30:12BA";
  };
  hardware.nvidia.vgpu.patcher.options.doNotForceGPLLicense = true;
  # hardware.nvidia.vgpu.patcher.options.extra = [
  #   "--spoof-devid"
  # ];
  hardware.nvidia.vgpu.patcher.profileOverrides = {
    "331" = {
      vramAllocation = 2048;  # MiB
      heads = 1;
      enableCuda = true;
      display.width = 1920;
      display.height = 1080;
      framerateLimit = 60;
      xmlConfig = {
        frame_rate_limiter = "0";
      };
    };
    "334" = {
      vramAllocation = 2048;  # MiB
      heads = 1;
      enableCuda = true;
      display.width = 1920;
      display.height = 1080;
      framerateLimit = 60;
      xmlConfig = {
        frame_rate_limiter = "0";
      };
    };
  };
  programs.mdevctl.enable = true;
  environment.systemPackages = with pkgs; [
    libxml2
  ];
  environment.etc = {
    "libvirt/hooks/qemu.d/prepare/begin".source = ./qemu.d/prepare/begin;
    "libvirt/hooks/qemu.d/release/end".source = ./qemu.d/release/end;
  };
}
