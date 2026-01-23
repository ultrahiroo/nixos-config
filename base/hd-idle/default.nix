{ pkgs, ... }:
{
  systemd.services.hd-idle = {
    description = "hd-idle - spin down idle hard disks";
    documentation = [ "man:hd-idle(8)" ];
    after = [
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
      "suspend-then-hibernate.target"
    ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 120";
      Restart = "always";
    };
  };
}
