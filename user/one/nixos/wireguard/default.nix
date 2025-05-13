{ inputs, ... }: {
  networking.wg-quick.interfaces.wg0 = {
    autostart = true;
    configFile = "${inputs.wireguard-config}/wg0.conf";
  };
}
