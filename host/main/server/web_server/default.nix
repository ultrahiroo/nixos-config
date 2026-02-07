{ ... }:
{
  systemd.services."web_server" = {
    description = "Web Server Service";
    wantedBy = [ "default.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    script = "/user/one/shell/service/web_server";
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };
}
