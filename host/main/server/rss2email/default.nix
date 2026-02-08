{
  config,
  lib,
  pkgs,
  ...
}:
let
  rss2email_cfg = {
    "DEFAULT" = {
      to = "ultrahiroo20000@yahoo.co.jp";
    };
    "feed.wlroots" = {
      url = "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases.atom";
    };
    "feed.ValeBlog" = {
      url = "https://verdagon.dev/rss.xml";
    };
  };
in
{
  users.groups = {
    rss2email.gid = config.ids.gids.rss2email;
  };

  users.users = {
    rss2email = {
      description = "rss2email user";
      uid = config.ids.uids.rss2email;
      group = "rss2email";
    };
  };

  environment.systemPackages = with pkgs; [ rss2email ];

  systemd.tmpfiles.settings."10-rss2email"."/var/rss2email".d = {
    user = "rss2email";
    group = "rss2email";
    mode = "0700";
  };

  systemd.services.rss2email =
    let
      conf = pkgs.writeText "rss2email.cfg" (lib.generators.toINI { } rss2email_cfg);
    in
    {
      preStart = ''
        if [ ! -f /var/rss2email/db.json ]; then
          echo '{"version":2,"feeds":[]}' > /var/rss2email/db.json
        fi
      '';
      path = [ pkgs.system-sendmail ];
      serviceConfig = {
        ExecStart = "${pkgs.rss2email}/bin/r2e -c ${conf} -d /var/rss2email/db.json run";
        User = "rss2email";
      };
    };

  systemd.timers.rss2email = {
    partOf = [ "rss2email.service" ];
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* *:0/5:00";
      Persistent = true;
    };
  };
}
