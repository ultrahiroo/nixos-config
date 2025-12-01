{ ... }:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        log = {
          date = "format-local:%Y-%m-%d %H:%M:%S";
        };
        user = {
          name = "Inoue Hiroo";
          email = "ultrahiroo2000@yahoo.co.jp";
        };
      };
    };
  };
}
