{ ... }:
{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
      };
    };
    initrd = {
      systemd = {
        enable = true;
      };
    };
  };
}
