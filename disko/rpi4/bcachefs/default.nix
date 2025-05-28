{ pkgs, ... }: let
  mount_point = "/mnt";
  target = "${mount_point}/boot/firmware";
  postMountHook-boot = ''
    mkdir ${target}/
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
in
{
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
      ${pkgs.bcachefs-tools}/bin/bcachefs device resize $rootPart

      rm -f /disko-first-boot
    fi
  '';
  disko = {
    # imageBuilder.extraPostVM = ''
    #   ${pkgs.zstd}/bin/zstd --compress $out/*raw
    #   rm $out/*raw
    # '';
    devices = {
      disk = {
        rpi4-bcachefs = {
          imageSize = "50G";
          type = "disk";
          device = "/dev/mmcblk0";
          # postCreateHook = ''
          #   lsblk
          #   sgdisk -A 1:set:2 /dev/vda
          # '';
          content = {
            type = "gpt";
            partitions = {
              boot = {
                size = "1G";
                type = "EF00";
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
                  type = "bcachefs";
                  extraArgs = [
                    "--compression=zstd"
                  ];
                  mountpoint = "/";
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
