{ pkgs, ... }: let
  mount_point = "/mnt";
  target = "${mount_point}/boot";
  postMountHook-boot = ''
    mkdir -p ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bootcode.bin ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/fixup4.dat ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/start4.elf ${target}/
    cp ${pkgs.ubootRaspberryPi4_64bit}/u-boot.bin ${target}/u-boot-rpi4.bin
    cp ${pkgs.raspberrypi-armstubs}/armstub8-gic.bin ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-4-b.dtb ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-400.dtb ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-cm4.dtb ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-cm4s.dtb ${target}/
    cp ${../config.txt} ${target}/config.txt
  '';
  postMountHook-root = ''
    touch ${mount_point}/disko-first-boot
  '';
in {
  imports = [
    ../../common
  ];
  boot.postBootCommands = ''
    if [ -f /disko-first-boot ]; then
      set -euo pipefail
      set -x

      rootPart=$(${pkgs.util-linux}/bin/findmnt -n -o SOURCE /)
      bootDevice=$(${pkgs.util-linux}/bin/lsblk -npo PKNAME $rootPart)
      partNum=$(${pkgs.util-linux}/bin/lsblk -npo MAJ:MIN $rootPart | ${pkgs.gawk}/bin/awk -F: '{print $2}')

      echo ",+," | ${pkgs.util-linux}/bin/sfdisk -N$partNum --no-reread $bootDevice
      ${pkgs.parted}/bin/partprobe
      ${pkgs.btrfs-progs}/bin/btrfs filesystem resize max /

      rm -f /disko-first-boot
    fi
  '';
  disko = {
    devices = {
      disk = {
        rpi4-btrfs = {
          imageSize = "50G";
          type = "disk";
          device = "/dev/mmcblk0";
          content = {
            type = "gpt";
            partitions = {
              boot = {
                type = "EF00";
                size = "1G";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                  postMountHook = postMountHook-boot;
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  mountpoint = "/";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                  postMountHook = postMountHook-root;
                };
              };
            };
          };
        };
      };
    };
  };
}
