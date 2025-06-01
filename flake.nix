{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1&ref=v0.48.0";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins?ref=v0.48.0";
      inputs.hyprland.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.48.0";
      inputs.hyprland.follows = "hyprland";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    maomaowm = {
      url = "github:DreamMaoMao/maomaowm?ref=0.4.7";
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
    terminal_emulator = {
      url = "path:./package/terminal_emulator";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, ... }: {
    nixosConfigurations = let
      nixos_version = "25.05";
      all_username = [
        "root"
        "one"
      ];
      all_normal_username = [
        "one"
      ];
      default_username = "one";
      specialArgs = {
        inherit inputs;
        inherit all_username;
        inherit all_normal_username;
        inherit default_username;
        inherit nixos_version;
      };

      nixpkgs-overlay = [ (final: prev: {
        custom = {
          clean = inputs.clean.packages.${prev.system}.default;
          codon = inputs.codon.packages.${prev.system}.default;
          terminal_emulator = inputs.terminal_emulator.packages.${prev.system}.default;
        };
        firefox-addons = inputs.firefox-addons.packages.${prev.system};
      }) ];

      commom_module = [
        ({ ... }: { nixpkgs.overlays = nixpkgs-overlay; })
        ./generator
        ./nixos
        ./user
      ];

    in {
      main = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = commom_module ++ [
          ./host/main
        ];
      };

      rpi4 = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "aarch64-linux";
        modules = commom_module ++ [
          ./host/rpi4
          ./host/rpi4/filesystem
        ];
      };

      rpi4-disko = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "aarch64-linux";
        modules = commom_module ++ [
          ./host/rpi4
          # ./disko/rpi4/btrfs
          # ./disko/rpi4/bcachefs
          ./disko/rpi4/xfs
        ];
      };
    };
  };
}
