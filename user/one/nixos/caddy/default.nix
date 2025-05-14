{ pkgs, username, ... }: {
  services.caddy = {
    enable = true;
    configFile = ./Caddyfile;
  };
}
