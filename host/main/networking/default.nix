{ ... }: {
  networking = {
    hostName = "main";
    interfaces.eno1.ipv4.addresses = [
      {
        address = "192.168.0.23";
        prefixLength = 24;
      }
    ];
  };
}
