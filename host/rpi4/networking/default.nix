{ ... }:
{
  networking = {
    interfaces.eth0.ipv4.addresses = [
      {
        address = "192.168.0.24";
        prefixLength = 24;
      }
    ];
  };
}
