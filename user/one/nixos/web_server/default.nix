{ pkgs, username, ... }: {
  systemd.user.services."${username}-mydns" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "MyDNS Service";
    serviceConfig = {
        Type = "simple";
        ExecStart = "/user/one/project/mydns/mydns";
    };
  };
  systemd.user.services."${username}-wireproxy" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "Wireproxy Service";
    serviceConfig = {
        Type = "simple";
        ExecStart = "/user/one/shell/service/wireproxy";
    };
  };
  systemd.user.services."${username}-caddy" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "Caddy Service";
    serviceConfig = {
        Type = "simple";
        ExecStart = "/user/one/shell/service/caddy";
    };
  };
  systemd.user.services."${username}-web_server" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "Web Server Service";
    serviceConfig = {
        Type = "simple";
        ExecStart = "/user/one/shell/service/web_server";
    };
  };
}
