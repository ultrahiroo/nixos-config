let
  main = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgIfC7+nBWX8ri8DAYaiBEK9eGdp2me3emN/JqcjXcU";
in
{
  "user_one_password.age".publicKeys = [ main ];
  "forgejo_admin_password.age".publicKeys = [ main ];
}
