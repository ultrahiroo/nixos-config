let
  root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgIfC7+nBWX8ri8DAYaiBEK9eGdp2me3emN/JqcjXcU root@nixos";
in
{
  "secret1.age".publicKeys = [ root ];
}
