{ ... }: {
  system.stateVersion = "24.11";

  networking = {
    defaultGateway = "192.168.0.23";
  };
}
