{ ... }: {
  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    wireless.enable = false;
    nameservers = [
      "8.8.8.8"
    ];
  };
}
