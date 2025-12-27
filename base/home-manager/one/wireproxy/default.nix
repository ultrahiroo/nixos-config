{ pkgs, ... }:
{
  systemd.user.services = {
    wireproxy = {
      Unit = {
        Description = "Wireproxy Service";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        # User = "root";
        ExecStart = "${pkgs.wireproxy}/bin/wireproxy --config /etc/wireproxy/wireproxy.conf";
        #ExecStart = "${pkgs.wireproxy}/bin/wireproxy --config ${inputs.wireproxy-config}/wireproxy.conf";
        # ExecReload = "${pkgs.wireproxy}/bin/wireproxy --config ${inputs.wireproxy-config}/wireproxy.conf";
        Restart = "always";

        #NoNewPrivileges = "false";
      };
    };
  };
}
