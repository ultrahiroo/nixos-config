{ config, lib, ... }:
{
  services.forgejo = {
    enable = true;
    lfs.enable = true;
    settings.server = {
      DOMAIN = "git.inouehiroo.mydns.jp";
      HTTP_PORT = 8000;
      PROTOCOL = "http";
      ROOT_URL = "https://git.inouehiroo.mydns.jp";
      SSH_PORT = lib.head config.services.openssh.ports;
    };
  };
}
