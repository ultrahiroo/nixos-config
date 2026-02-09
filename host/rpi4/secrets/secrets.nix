let
  rpi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK1kBSlJydDL8tv1tULpDQdB8n98RDvKnPpacLgGDxJ3";
in
{
  "user_one_password.age".publicKeys = [ rpi ];
  "forgejo_admin_password.age".publicKeys = [ rpi ];
}
