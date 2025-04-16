{ ... }: {
  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    wireless.enable = false;
  };
}
