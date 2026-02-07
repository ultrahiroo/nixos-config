{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wireproxy
  ];
  systemd.services."wireproxy" = {
    description = "Wireproxy Service";
    wantedBy = [ "default.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    script = "${pkgs.wireproxy}/bin/wireproxy --config /etc/wireproxy/wireproxy.conf";
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };
}
