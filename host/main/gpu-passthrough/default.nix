{ ... }:
let
  vfio_id = [
    "10de:2187"
    "10de:1aeb"
  ];
  vfio_id_string = "${builtins.concatStringsSep "," vfio_id}";
in
{
  # boot = {
  #   kernelParams = [
  #     "vfio-pci.ids=${vfio_id_string}"
  #   ];
  #   extraModprobeConfig = "options vfio-pci ids=${vfio_id_string}";
  # };

  environment.etc = {
    "libvirt/hooks/qemu.d/prepare/begin".source = ./qemu.d/prepare/begin;
    "libvirt/hooks/qemu.d/release/end".source = ./qemu.d/release/end;
  };
}
