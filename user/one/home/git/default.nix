{ ... }: {
  programs = {
    git = {
      enable = true;
      userName = "Inoue Hiroo";
      userEmail = "ultrahiroo2000@yahoo.co.jp";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
