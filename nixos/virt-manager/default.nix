{ pkgs, all_username, ... }: {
  users.groups.libvirtd.members = all_username;
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
    };
  };
  virtualisation.libvirtd.hooks.qemu = {
    "qemu" = ./qemu;
  };
}
