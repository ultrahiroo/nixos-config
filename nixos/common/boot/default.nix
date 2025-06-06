{ ... }:
{
  boot = {
    loader = {
      timeout = 3;
    };
    initrd = {
      verbose = false;
    };
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "boot.shell_on_fail"

      "udev.log_priority=0"
      "systemd.show_status=false"
    ];
  };
}
