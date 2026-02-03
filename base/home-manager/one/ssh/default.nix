{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraConfig = "
      Host main
        Hostname 192.168.0.23
        Port 22
        User one
      Host rpi
        Hostname 192.168.0.24
        Port 22
        User one
    ";
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
  };
}
