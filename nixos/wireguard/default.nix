{ username, ... }: {
  networking.wg-quick.interfaces.wg0 = {
    autostart = true;
    configFile = "/home/${username}/.config/wireguard/wg0.conf";
  };
}
