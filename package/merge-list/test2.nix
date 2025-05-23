let
  username_list = [
    "one"
    "two"
  ];
  forEach = xs: f: map f xs;
  all_user = forEach username_list (
    x: { users = { ${x} = { imports = [ ./user/${x}/home ]; }; }; }
  );
in
  all_user
