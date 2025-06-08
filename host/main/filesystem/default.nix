{ ... }:
{
  fileSystems."/home/one/mount" = {
    device = "/dev/disk/by-uuid/bb99279a-1612-4641-ab80-8320893cadd2";
    fsType = "btrfs";
    options = [
      "compress-force=zstd"
    ];
  };
}
