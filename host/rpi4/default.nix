{ ... }: {
  imports = [
    ./audio
    ./gpu
    ./networking
  ];

  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];

  boot = {
    # loader = {
    #   grub.enable = false;
    #   generic-extlinux-compatible.enable = true;
    # };
    consoleLogLevel = 7;
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=ttyAMA0,115200n8"
      "console=tty0"
    ];
  };

  hardware = {
    raspberry-pi."4".bluetooth = {
      enable = false;
    };
  };
}
