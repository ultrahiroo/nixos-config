{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify-adblock
  ];
  networking.firewall = {
    allowedTCPPorts = [ 57621 ];
    allowedUDPPorts = [ 5353 ];
  };
}
