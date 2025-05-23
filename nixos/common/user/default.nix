{ pkgs, ... }: {
  users = {
    # mutableUsers = false;
    mutableUsers = true;
    groups."one" = {
      gid = 1000;
    };
    users = {
      "root" = {
        initialHashedPassword = (
          "$6$password$kagg83hYw4lF/qzigl9vD8NOVg/VxDNldf.GUcJ/ECPqcQS68ANCEAEme0qlR1DGkA4d778ovqsCinxAp9znl0"
        );
      };
      "one" = {
        uid = 1000;
        group = "one";
        isNormalUser = true;
        description = "one";
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
          "input"
          "kvm"
        ];
        home = "/home/one";
        shell = pkgs.yash;
        packages = with pkgs; [
        ];
        initialHashedPassword = (
          "$6$password$kagg83hYw4lF/qzigl9vD8NOVg/VxDNldf.GUcJ/ECPqcQS68ANCEAEme0qlR1DGkA4d778ovqsCinxAp9znl0"
        );
      };
    };
  };
}
