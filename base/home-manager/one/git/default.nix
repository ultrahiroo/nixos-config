{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-credential-manager
  ];
  programs.git = {
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
      credential = {
        credentialStore = "cache";
        "git.inouehiroo.mydns.jp" = {
          provider = "generic";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
          oauthClientId = "e90ee53c-94e2-48ac-9358-a874fb9e0662";
          oauthAuthorizeEndpoint = "/login/oauth/authorize";
          oauthTokenEndpoint = "/login/oauth/access_token";
        };
      };
    };
  };
}
