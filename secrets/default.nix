{ ... }:
{
  age.secrets = {
    "user_one_password".file = ./user_one_password.age;
    "forgejo_admin_password".file = ./forgejo_admin_password.age;
  };
}
