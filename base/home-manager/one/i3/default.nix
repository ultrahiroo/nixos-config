{ ... }:
{
  home = {
    file = {
      ".config/i3/config".source = ./i3/config;
      ".config/picom/picom.conf".source = ./picom/picom.conf;
    };
  };
}
