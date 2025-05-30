{ ... }: {
  networking = {
    hostName = "rpi4";
    interfaces.eno1.ipv4.addresses = [
      {
        address = "192.168.0.24";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.0.1";
  };
}
