{ ... }:
let
  platform = "intel";  # intel or amd
in {
  boot = {
    kernelModules = [
      "kvm-${platform}"
      "vfio"
      "vfio_iommu_type1"
      "vfio_pci"
    ];
    kernelParams = [
      "${platform}_iommu=on"
      "iommu=pt"
      # "pcie_acs_override=downstream,multifunction"
    ];
  };
}
