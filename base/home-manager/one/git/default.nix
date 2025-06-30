{ ... }: {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      userName = "Inoue Hiroo";
      userEmail = "ultrahiroo2000@yahoo.co.jp";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        log = {
          date = "format-local:%Y-%m-%d %H:%M:%S";
        };
      };
    };
  };
}
