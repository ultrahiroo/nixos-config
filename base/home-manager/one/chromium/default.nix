{ pkgs, ... }:
{
  programs = {
    chromium = {
      enable = true;
      package = (pkgs.chromium.override { enableWideVine = true; });
      commandLineArgs = [
        "--enable-features=AcceleratedVideoEncoder"
        "--enable-features=DefaultANGLEVulkan"
        "--enable-features=PlatformHEVCDecoderSupport"
        "--enable-features=TouchpadOverscrollHistoryNavigation"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo"
        "--enable-features=VaapiIgnoreDriverChecks"
        "--enable-features=VaapiOnNvidiaGPUs"
        "--enable-features=VaapiVideoDecoder"
        "--enable-features=Vulkan"
        "--enable-features=VulkanFromANGLE"
        "--enable-zero-copy"
        "--ignore-gpu-blocklist"
      ];
      extensions = [
        # {id = "";}
      ];
    };
  };
}
