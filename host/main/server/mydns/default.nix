{ pkgs, ... }:
{
  systemd.services."mydns" = {
    description = "MyDNS Service";
    wantedBy = [ "default.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    script = "${pkgs.python3}/bin/python3 /user/one/project/mydns/mydns";
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };
}
