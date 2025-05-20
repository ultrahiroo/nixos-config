{ ... }:
let
  vfio_id = [
    "10de:2187"
    "10de:1aeb"
  ];
  vfio_id_string = "${builtins.concatStringsSep "," vfio_id}";
  vm_name = "win11";
in {
  # boot = {
  #   kernelParams = [
  #     "vfio-pci.ids=${vfio_id_string}"
  #   ];
  #   extraModprobeConfig = "options vfio-pci ids=${vfio_id_string}";
  # };
  environment.etc = {
    "libvirt/hooks/qemu".source = ./qemu;
    "libvirt/hooks/qemu.d/${vm_name}/prepare/begin/start.sh".source = ./start.sh;
    "libvirt/hooks/qemu.d/${vm_name}/release/end/stop.sh".source = ./stop.sh;
  };
}
