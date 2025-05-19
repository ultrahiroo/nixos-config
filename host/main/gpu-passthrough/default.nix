{ ... }:
let
  platform = "intel";  # intel or amd
  vfio_id = [
    "10de:2187"
    "10de:1aeb"
  ];
  vfio_id_string = "${builtins.concatStringsSep "," vfio_id}";
  vm_name = "win11";
in {
  boot = {
    kernelModules = [
      "kvm-${platform}"
      "vfio"
      "vfio_iommu_type1"
      "vfio_pci"

      # "nvidia_vgpu_vfio"
      # "mdev"
      # "vfio_mdev"
    ];
    kernelParams = [
      "${platform}_iommu=on"
      "iommu=pt"
      # "vfio-pci.ids=${vfio_id_string}"
      # "pcie_acs_override=downstream,multifunction"
    ];
    # extraModprobeConfig = "options vfio-pci ids=${vfio_id_string}";
  };

  environment.etc = {
    "libvirt/hooks/qemu".source = ./qemu;
    "libvirt/hooks/qemu.d/${vm_name}/prepare/begin/start.sh".source = ./start.sh;
    "libvirt/hooks/qemu.d/${vm_name}/release/end/stop.sh".source = ./stop.sh;
  };
}
