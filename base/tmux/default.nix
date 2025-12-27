{ pkgs, ... }:
{
  systemd.services.root-tmux = {
    serviceConfig = {
      ExecStart = "${pkgs.tmux}/bin/tmux -S /tmp/tmux.socket new-session -s my-session -d";
      ExecStop = "${pkgs.tmux}/bin/tmux -S /tmp/tmux.socket kill-session -t my-session";
      Type = "forking";
    };
  };
}
