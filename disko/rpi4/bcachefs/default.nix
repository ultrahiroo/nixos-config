{ inputs, pkgs, ... }:
let
  first_boot_filename = "first-boot";
  mount_point = "/mnt";
  target = "${mount_point}/firmware";
  postMountHook-boot = ''
    mkdir -p ${target}/
    cp ${inputs.raspberrypi-firmware}/boot/fixup4.dat ${target}/
    cp ${inputs.raspberrypi-firmware}/boot/start4.elf ${target}/
    cp ${pkgs.ubootRaspberryPi4_64bit}/u-boot.bin ${target}/u-boot-rpi4.bin
    cp ${pkgs.raspberrypi-armstubs}/armstub8-gic.bin ${target}/
    cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-4-b.dtb ${target}/
    cp ${../config.txt} ${target}/config.txt
  '';
  postMountHook-root = ''
    touch ${mount_point}/${first_boot_filename}
  '';
in
{
  imports = [
    ../../common
  ];
  boot.postBootCommands = ''
    if [ -f /${first_boot_filename} ]; then
      set -euxo pipefail

      rootPart=$(${pkgs.util-linux}/bin/findmnt -n -o SOURCE /)
      bootDevice=$(${pkgs.util-linux}/bin/lsblk -npo PKNAME $rootPart)
      partNum=$(${pkgs.util-linux}/bin/lsblk -npo MAJ:MIN $rootPart | ${pkgs.gawk}/bin/awk -F: '{print $2}')

      echo ",+," | ${pkgs.util-linux}/bin/sfdisk -N$partNum --no-reread $bootDevice
      ${pkgs.parted}/bin/partprobe
      ${pkgs.bcachefs-tools}/bin/bcachefs device resize $rootPart

      rm -f /${first_boot_filename}
    fi
  '';
  disko = {
    devices = {
      disk = {
        main = {
          imageSize = "20G";
          type = "disk";
          device = "/dev/mmcblk0";
          postCreateHook = ''
            lsblk
            sgdisk -A 1:set:2 /dev/vda
          '';
          content = {
            type = "gpt";
            partitions = {
              firmware = {
                priority = 1;
                size = "30M";
                type = "0700";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/firmware";
                  postMountHook = postMountHook-boot;
                };
              };
              boot = {
                priority = 2;
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                };
              };
              root = {
                priority = 3;
                size = "100%";
                type = "8300";
                content = {
                  type = "filesystem";
                  format = "bcachefs";
                  mountpoint = "/";
                  mountOptions = [
                    "compression=zstd"
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
