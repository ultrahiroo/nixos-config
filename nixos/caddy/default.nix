{ pkgs, username, ... }: {
  systemd.user.services."caddy-config" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "Caddy Service";
    serviceConfig = {
        Type = "simple";
        # User = "one";
        # Group = "one";
        ExecStart = "${pkgs.caddy}/bin/caddy run --config /user/one/setting/caddy/Caddyfile";
        Restart = "on-failure";
        # RestartPreventExitStatus = 1;
        # RestartSec = "5s";
        # NoNewPrivileges = true;
    };
  };
  security.sudo.enable = true;
}
