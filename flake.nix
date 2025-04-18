{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1&ref=v0.48.0";
    };
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.48.0";
      inputs.hyprland.follows = "hyprland";
    };
    hyprbars = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    clean-flake = {
      url = "path:/user/one/project/clean";
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
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    clean-flake,
    ...
  }: {
    nixosConfigurations = {
      nixos-test = let
        username = "one";
        specialArgs = {
          inherit username;
          inherit inputs;
        };
        clean-overlay = final: prev: {
          cleanPackage = clean-flake.packages.${prev.system};
        };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./host/nixos-test
            ./user/${username}/nixos.nix

            ({ config, pkgs, ... }: { nixpkgs.overlays = [
              clean-overlay
            ]; })

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username}.imports = [
                ./user/${username}/home.nix
              ];
            }
          ];
        };

      main = let
        username = "one";
        specialArgs = {
          inherit username;
          inherit inputs;
        };
        clean-overlay = final: prev: {
          cleanPackage = clean-flake.packages.${prev.system};
        };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./host/main
            ./user/${username}/nixos.nix

            ({ config, pkgs, ... }: { nixpkgs.overlays = [
              clean-overlay
            ]; })

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username}.imports = [
                ./user/${username}/home.nix
              ];
            }
          ];
        };
    };
  };
}
