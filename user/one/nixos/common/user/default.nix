{ pkgs, username, ... }: {
  users.users.${username} = {
    uid = 1000;
    group = username;
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "input"
      "kvm"
    ];
    home = "/home/${username}";
    shell = pkgs.yash;
    packages = with pkgs; [
    ];
  };
  users.groups.${username} = {
    gid = 1000;
  };
}
