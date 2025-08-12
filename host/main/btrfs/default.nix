{ pkgs, ... }: {
  # systemd.timers."btrfs-balance" = {
  #   wantedBy = [ "timers.target" ];
  #   timerConfig = {
  #     OnBootSec = "5m";
  #     OnUnitActiveSec = "1d";
  #     Unit = "btrfs-balance.service";
  #   };
  # };
  # systemd.services."btrfs-balance" = {
  #   script = ''
  #     ${pkgs.btrfs-progs}/bin/btrfs balance start -dusage=10 /
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "root";
  #   };
  # };

  systemd.services."btrfs-balance-auto" = {
    wantedBy = [ "sysinit.target" ];
    script = let
      uuid_list = [
        "ddacd9bc-110f-4621-aa1b-f257830ee5ec"
        "bb99279a-1612-4641-ab80-8320893cadd2"
      ];
      value = 10;
    in ''
      UUID_LIST='${toString uuid_list}'
      for UUID in $UUID_LIST; do
          TARGET="/sys/fs/btrfs/$UUID/allocation/data/bg_reclaim_threshold"
          BEFORE_VALUE=$(cat $TARGET)
          echo ${toString value} > $TARGET
          AFTER_VALUE=$(cat $TARGET)
          echo "$TARGET: set $BEFORE_VALUE to $AFTER_VALUE"
      done
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  services.beesd.filesystems = {
    root = {
      spec = "/";
      hashTableSizeMB = 128;
      verbosity = "crit";
      extraOptions = [
        "--loadavg-target" "1.0"
      ];
    };
    mount = {
      spec = "/home/one/mount";
      hashTableSizeMB = 128;
      verbosity = "crit";
      extraOptions = [
        "--loadavg-target" "1.0"
      ];
    };
  };
}
