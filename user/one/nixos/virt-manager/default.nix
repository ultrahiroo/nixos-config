{ pkgs, username, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ username ];
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
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
  };
}
