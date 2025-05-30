{ pkgs, all_username, ... }: {
  systemd.services.keyd = {
    description = "key remapping daemon";
    enable = true;
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.keyd}/bin/keyd";
    };
    wantedBy = [ "sysinit.target" ];
    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];
  };
  environment.etc = {
    "keyd/default.conf".source = ./keyd/default.conf;
  };
  users.groups.keyd.members = all_username;
}
