{ pkgs, ... }:
{
  systemd.user.services = {
    mydns = {
      Unit = {
        Description = "MyDNS Service";
        After = [ "network-online.target" ];
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.python3}/bin/python3 /user/one/project/mydns/mydns";
        ExecReload = "${pkgs.python3}/bin/python3 /user/one/project/mydns/mydns";
      };
    };
  };
}
