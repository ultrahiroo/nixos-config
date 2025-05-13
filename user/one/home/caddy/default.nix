{ pkgs, username, ... }: {
  systemd.user.services = {
    "${username}-caddy" = {
      Unit = {
        Description = "Caddy Service";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.caddy}/bin/caddy run --config /user/one/setting/caddy/Caddyfile";
        ExecReload = "${pkgs.caddy}/bin/caddy run --config /user/one/setting/caddy/Caddyfile";
      };
    };
  };
}
