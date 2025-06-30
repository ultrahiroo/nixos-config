{ ... }: {
  programs = {
    brave = {
      enable = true;
    };
  };
  # Brave crash because Read-only file system
  # home.file = {
  #   ".cache/BraveSoftware/Brave-Browser/Default".source = ./Default;
  #   ".config/BraveSoftware/Brave-Browser".source = ./config;
  # };
}
