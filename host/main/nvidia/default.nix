{ config, lib, pkgs, ... }: {
  boot.blacklistedKernelModules = [
    # "nouveau"
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

    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "535.216.01";
    #   sha256_64bit = "sha256-Xd6hFHgQAS4zlnwxgTQbzWYkvT1lTGP4Rd+DO07Oavc=";
    #   sha256_aarch64 = "sha256-SGmuA0W1iSsqUK7VZsgibT4HgT0RkKpGb+ul6eIbM7k=";
    #   openSha256 = "sha256-ey96oMbY32ahcHSOj1+MykvJrep6mhHPVl+V8+B2ZDk=";
    #   settingsSha256 = "sha256-9PgaYJbP1s7hmKCYmkuLQ58nkTruhFdHAs4W84KQVME=";
    #   persistencedSha256 = "sha256-ckF/BgDA6xSFqFk07rn3HqXuR0iGfwA4PRxpP38QZgw=";
    # };
    package = config.boot.kernelPackages.nvidiaPackages.production;

    # package = config.boot.kernelPackages.nvidiaPackages.vgpu_16_2;
    # package = config.boot.kernelPackages.nvidiaPackages.vgpu_16_5;
    # package = config.boot.kernelPackages.nvidiaPackages.vgpu_17_3;
  };

  boot.kernelModules = lib.mkBefore [
    "kvm-intel"
    "nvidia"
  ];
}
