{ ... }:
{
  networking = {
    hostName = "main";
    interfaces.eth0.ipv4.addresses = [
      {
        address = "192.168.0.23";
        prefixLength = 24;
      }
    ];
  };
}
