{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raspberrypi-firmware = {
      url = "github:raspberrypi/firmware?ref=1.20250430";
      flake = false;
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    mango = {
      url = "github:DreamMaoMao/mangowc?ref=0.10.6";
    };
    vgpu4nixos = {
      url = "github:mrzenc/vgpu4nixos";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    merge-list = {
      url = "path:./package/merge-list";
    };
    clean = {
      url = "path:./package/clean";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codon = {
      url = "path:./package/codon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    terminal = {
      url = "path:./package/terminal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, ... }:
    {
      nixosConfigurations =
        let
          nixos_version = "25.11";
          all_username = [
            "root"
            "one"
          ];
          all_normal_username = [
            "one"
          ];
          default_username = "one";
          _specialArgs = {
            inherit inputs;
            inherit all_username;
            inherit all_normal_username;
            inherit default_username;
            inherit nixos_version;
          };

        in
        {
          main =
            let
              hostname = "main";
              system = "x86_64-linux";
              specialArgs = _specialArgs // {
                inherit hostname;
                inherit system;
              };
            in
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              inherit specialArgs;
              modules = [
                ./base
                ./host/main
              ];
            };

          rpi4-btrfs =
            let
              hostname = "rpi4-btrfs";
              system = "aarch64-linux";
              specialArgs = _specialArgs // {
                inherit hostname;
                inherit system;
              };
            in
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              inherit specialArgs;
              modules = [
                ./base
                ./host/rpi4
                ./host/rpi4/filesystem
              ];
            };

          rpi4-btrfs-disko =
            let
              hostname = "rpi4-btrfs";
              system = "aarch64-linux";
              specialArgs = _specialArgs // {
                inherit hostname;
                inherit system;
              };
            in
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              inherit specialArgs;
              modules = [
                ./base
                ./host/rpi4
                ./disko/rpi4/btrfs
              ];
            };

          rpi4-bcachefs-disko =
            let
              hostname = "rpi4-bcachefs";
              system = "aarch64-linux";
              specialArgs = _specialArgs // {
                inherit hostname;
                inherit system;
              };
            in
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              inherit specialArgs;
              modules = [
                ./base
                ./host/rpi4
                ./disko/rpi4/bcachefs
              ];
            };

          rpi4-xfs-disko =
            let
              hostname = "rpi4-xfs";
              system = "aarch64-linux";
              specialArgs = _specialArgs // {
                inherit hostname;
                inherit system;
              };
            in
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              inherit specialArgs;
              modules = [
                ./base
                ./host/rpi4
                ./disko/rpi4/xfs
              ];
            };
        };
    };
}
