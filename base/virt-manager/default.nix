{ pkgs, all_username, ... }: {
  programs.virt-manager.enable = true;
  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [(pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd];
        };
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
      onBoot = "ignore";
      onShutdown = "shutdown";
      hooks.qemu = {
        "qemu" = ./qemu;
      };
    };
  };
  users.groups = {
    libvirtd.members = all_username;
    input.members = all_username;
    kvm.members = all_username;
  };
}
