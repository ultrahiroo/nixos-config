{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rss2email
    ];
  };

  systemd.user.services = {
    rss2email = {
      Unit = {
        Description = "rss2email service";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.rss2email}/bin/rss2email run";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };

  systemd.user.timers = {
    rss2email = {
      Unit = {
        Description = "timer for rss2email service";
      };
      Timer = {
        Unit = "rss2email";
        OnCalendar = "*-*-* 00:00:00";
        Persistent = true;
      };
      Install.WantedBy = [ "timers.target" ];
    };
  };
}
