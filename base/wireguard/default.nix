{ ... }:
{
  networking.wg-quick.interfaces.wg0 = {
    autostart = true;
    configFile = "/etc/wireguard/wg0.conf";
  };
}
