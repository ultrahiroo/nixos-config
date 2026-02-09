{ hostname, ... }:
{
  networking = {
    firewall = {
      enable = false; # TODO
    };
    networkmanager = {
      enable = false;
    };
    dhcpcd = {
      enable = false;
    };
    wireless = {
      enable = false;
    };
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    hostName = hostname;
    defaultGateway = "192.168.0.1";
    usePredictableInterfaceNames = false;
  };
}
