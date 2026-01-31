let
  pkgs = import <nixpkgs> { };

  x = [
    {
      number = "1";
      alias_key = "L";
      name = "BTOP";
      command = "alacritty --title BTOP --class BTOP --command btop";
      appid = "BTOP";
      title = "BTOP";
    }
    {
      number = "2";
      alias_key = "N";
      name = "FireFox";
      command = "firefox";
      appid = "firefox";
      title = "*";
    }
    {
      number = "3";
      alias_key = "U";
      name = "Alacritty";
      command = "alacritty";
      appid = "Alacritty";
      title = "*";
    }
    {
      number = "9";
      alias_key = "[";
      name = "Empty";
      command = "";
      appid = "*";
      title = "*";
    }
  ];

  lib = (import ./lib.nix) { pkgs = pkgs; };
  results = pkgs.lib.debug.runTests {
    test_1 = {
      expr = lib.get_mango_spawn_config x;
      expected = ''
        bind=ALT,1,spawn_on_empty,/nix/store/wirj049hjhjfg54yafnwhwwcmaxn5nkc-script-1.sh,1
        bind=ALT,L,spawn_on_empty,/nix/store/wirj049hjhjfg54yafnwhwwcmaxn5nkc-script-1.sh,1
        exec-once=/nix/store/wirj049hjhjfg54yafnwhwwcmaxn5nkc-script-1.sh
        windowrule=tags:1,appid:BTOP,title:BTOP

        bind=ALT,2,spawn_on_empty,/nix/store/znlj6szn7ysjkp0wfdc6w8cikspgvb6p-script-2.sh,2
        bind=ALT,N,spawn_on_empty,/nix/store/znlj6szn7ysjkp0wfdc6w8cikspgvb6p-script-2.sh,2
        exec-once=/nix/store/znlj6szn7ysjkp0wfdc6w8cikspgvb6p-script-2.sh
        windowrule=tags:2,appid:firefox,title:*

        bind=ALT,3,spawn_on_empty,/nix/store/82j7pm7d73l06khj9h9bhkpmqabrqx8y-script-3.sh,3
        bind=ALT,U,spawn_on_empty,/nix/store/82j7pm7d73l06khj9h9bhkpmqabrqx8y-script-3.sh,3
        exec-once=/nix/store/82j7pm7d73l06khj9h9bhkpmqabrqx8y-script-3.sh
        windowrule=tags:3,appid:Alacritty,title:*

        bind=ALT,9,spawn_on_empty,/nix/store/bqrrhwr8h43a88lydybzz8if222l3f6l-script-9.sh,9
        bind=ALT,[,spawn_on_empty,/nix/store/bqrrhwr8h43a88lydybzz8if222l3f6l-script-9.sh,9
        exec-once=/nix/store/bqrrhwr8h43a88lydybzz8if222l3f6l-script-9.sh
        windowrule=tags:9,appid:*,title:*
      '';
    };
    test_2 = {
      expr = lib.get_waybar_label x;
      expected = [
        "1 L BTOP"
        "2 N FireFox"
        "3 U Alacritty"
        "9 [ Empty"
      ];
    };
  };
in
if results == [ ] then "all tests passed" else "failed test: ${builtins.toJSON results}"
