{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
  environment.systemPackages = with pkgs; [
    wl-mirror
  ];
}
