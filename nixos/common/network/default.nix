{ ... }: {
  networking = {
    firewall.enable = false;
    networkmanager.enable = false;
    dhcpcd.enable = false;
    wireless.enable = false;
    nameservers = [
      "8.8.8.8"
    ];
  };
}
