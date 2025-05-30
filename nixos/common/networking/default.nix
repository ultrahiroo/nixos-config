{ ... }: {
  networking = {
    firewall = {
      enable = false;
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
      "8.8.8.8"
    ];
    defaultGateway = "192.168.0.1";
    usePredictableInterfaceNames = false;
  };
}
