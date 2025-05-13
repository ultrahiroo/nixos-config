{ pkgs, username, ... }: {
  systemd.user.services = {
    "${username}-mydns" = {
      Unit = {
        Description = "MyDNS Service";
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
