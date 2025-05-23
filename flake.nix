{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1&ref=v0.48.0";
    };
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.48.0";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins?ref=v0.48.0";
      inputs.hyprland.follows = "hyprland";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    vgpu4nixos = {
      url = "github:mrzenc/vgpu4nixos";
    };
    clean-flake = {
      url = "path:/user/one/project/clean";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codon-flake = {
      url = "path:/user/one/project/codon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    davinci-resolve-flake = {
      url = "path:/user/one/project/davinci-resolve";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    font-data = {
      url = "path:/user/one/home/www/collection/font";
      flake = false;
    };
    alacritty-config = {
      url = "path:/user/one/setting/alacritty";
      flake = false;
    };
    hyprland-config = {
      url = "path:/user/one/setting/hyprland/hypr";
      flake = false;
    };
    neovim-config = {
      url = "path:/user/one/setting/nvim";
      flake = false;
    };
    wireguard-config = {
      url = "path:/user/one/setting/wireguard";
      flake = false;
    };
    wireproxy-config = {
      url = "path:/user/one/setting/wireproxy/wireproxy";
      flake = false;
    };
  };

  outputs = inputs @ { self, ... }: {
    nixosModules.all-formats = { config, ... }: {
      imports = [
        inputs.nixos-generators.nixosModules.all-formats
      ];
      formatConfigs.sd-aarch64 = { ... }: {
        fileExtension = inputs.nixpkgs.lib.mkForce ".img";
        sdImage.compressImage = false;
      };
    };

    nixosConfigurations = let
      username = "one";
      username_list = [
        "one"
      ];
      specialArgs = {
        inherit username;
        inherit inputs;
      };
      overlay = [ (final: prev: {
        cleanPackage = inputs.clean-flake.packages.${prev.system};
        codonPackage = inputs.codon-flake.packages.${prev.system};
        davinci-resolvePackage = inputs.davinci-resolve-flake.packages.${prev.system};
      }) ];

      merge =
        lhs: rhs:
        lhs // rhs // (builtins.mapAttrs (
          rName: rValue:
          let
            lValue = lhs.${rName} or null;
          in
          if builtins.isAttrs lValue && builtins.isAttrs rValue then
            merge lValue rValue
          else if builtins.isList lValue && builtins.isList rValue then
            lValue ++ rValue
          else
            rValue
        ) rhs);
      mergeList = builtins.foldl' merge {};

      forEach = xs: f: map f xs;
      all_user = forEach username_list (
        x: { users = { ${x} = { imports = [ ./user/${x}/home ]; }; }; }
      );

    in {
      main = let
      in
        inputs.nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            # inputs.vgpu4nixos.nixosModules.host
            self.nixosModules.all-formats

            ./host/main
            ./nixos

            ({ ... }: { nixpkgs.overlays = overlay; })

            inputs.home-manager.nixosModules.home-manager {
              home-manager = (mergeList ([
                {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = specialArgs;
                }
              ] ++ all_user));
            }
          ];
        };

      rpi4 = let
      in
        inputs.nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "aarch64-linux";

          modules = [
            inputs.nixos-hardware.nixosModules.raspberry-pi-4
            self.nixosModules.all-formats

            ./host/rpi4
            ./nixos

            ({ ... }: { nixpkgs.overlays = overlay; })

            inputs.home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.${username}.imports = [
                  ./user/${username}/home
                ];
              };
            }
          ];
        };
    };
  };
}
