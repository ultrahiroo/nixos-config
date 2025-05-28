let
  pkgs = import <nixpkgs> {};
  set_1 = {
    nested_set = {
      list_value = [ "a" ];
      unique_value = "1";
      value = "same";
    };
  };
  set_2 = {
    nested_set = {
      list_value = [ "b" ];
      unique_value = "2";
      value = "same";
    };
  };
  set_3 = {
    nested_set = {
      list_value = [ "b" ];
      unique_value = "3";
      value = "same";
    };
  };
  x = [ set_1 set_2 set_3 ];

  func_out = (import ./flake.nix).outputs;
  out = func_out {};
  mergeList = out.lib.mergeList;
  expected = {
    nested_set = {
      list_value = [ "a" "b" "b" ];
      unique_value = "3";
      value = "same";
    };
  };
  results = pkgs.lib.debug.runTests {
    test_1 = {
      expr = mergeList x;
      expected = expected;
    };
  };
in
  if results == [ ] then
    "all tests passed"
  else
    "failed test: ${builtins.toJSON results}"
