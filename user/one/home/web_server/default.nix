{ ... }: {
  systemd.user.services = {
    web_server = {
      Unit = {
        Description = "Web Server Service";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "/user/one/shell/service/web_server";
        ExecReload = "/user/one/shell/service/web_server";
      };
    };
  };
}
