let
  main = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgIfC7+nBWX8ri8DAYaiBEK9eGdp2me3emN/JqcjXcU";
  rpi-btrfs = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK1kBSlJydDL8tv1tULpDQdB8n98RDvKnPpacLgGDxJ3";
in
{
  "user_one_password.age".publicKeys = [
    main
    rpi-btrfs
  ];
  "forgejo_admin_password.age".publicKeys = [
    main
    rpi-btrfs
  ];
}
