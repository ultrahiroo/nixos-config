{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    forgejo
    forgejo-cli
    forgejo-runner
  ];

  services.forgejo = {
    enable = true;
    package = pkgs.forgejo;
    lfs.enable = true;
    settings.server = {
      DOMAIN = "git.inouehiroo.mydns.jp";
      HTTP_PORT = 8000;
      PROTOCOL = "http";
      ROOT_URL = "https://git.inouehiroo.mydns.jp";
      SSH_PORT = lib.head config.services.openssh.ports;
    };
  };

  systemd.services.forgejo.preStart =
    let
      adminCommand = "${lib.getExe config.services.forgejo.package} admin user";
      password = config.age.secrets."forgejo_admin_password";
      user = "one";
    in
    ''
      PASSWORD="$(tr -d '\n' < ${password.path})"
      ${adminCommand} create --admin --email "root@localhost" --username ${user} --password $PASSWORD || true
      ${adminCommand} change-password --username ${user} --password $PASSWORD
    '';
}
