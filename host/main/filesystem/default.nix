{ ... }:
{
  fileSystems."/home/one/mount" = {
    device = "/dev/disk/by-uuid/bb99279a-1612-4641-ab80-8320893cadd2";
    fsType = "btrfs";
    options = [
      "compress-force=zstd"
    ];
  };
  fileSystems."/home/one/mount2" = {
    device = "/dev/disk/by-uuid/7262a56e-86ee-4454-9ed2-666fd82f2629";
    fsType = "btrfs";
    options = [
      "compress-force=zstd"
    ];
  };
  fileSystems."/home/one/mount3" = {
    device = "/dev/disk/by-uuid/b9ebcc82-2269-4934-b17d-964d3c660559";
    fsType = "btrfs";
    options = [
      "compress-force=zstd"
    ];
  };
}
