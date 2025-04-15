{
  description = "NixOS and Home Manager Configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cuda-maintainers.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    clean-flake = {
      url = "path:/user/one/project/clean";
      inputs.nixpkgs.follows = "nixpkgs";
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
        specialArgs = { inherit username; };
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

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./user/${username}/home.nix;
            }
          ];
        };

      main = let
        username = "one";
        specialArgs = { inherit username; };
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

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./user/${username}/home.nix;
            }
          ];
        };
    };
  };
}
