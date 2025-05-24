{ ... }: {
  programs = {
    firefox = {
      enable = true;
      profiles = {
        default = {
          id = 1;
        };
        one = {
          id = 0;
        };
      };
    };
  };
}
