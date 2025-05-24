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
    clean = {
      url = "path:/user/one/project/clean";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codon = {
      url = "path:/user/one/project/codon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    davinci-resolve = {
      url = "path:/user/one/project/davinci-resolve";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    terminal_emulator = {
      url = "path:/user/one/project/terminal_emulator";
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
      formatConfigs.virtualbox = { ... }: {
        virtualisation.virtualbox.guest = {
          enable = true;
          dragAndDrop = true;
        };
      };
    };

    nixosConfigurations = let
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
      };

      nixpkgs-overlay = [ (final: prev: {
        custom = {
          clean = inputs.clean.packages.${prev.system}.default;
          codon = inputs.codon.packages.${prev.system}.default;
          davinci-resolve = inputs.davinci-resolve.packages.${prev.system}.default;
          terminal_emulator = inputs.terminal_emulator.packages.${prev.system}.default;
        };
      }) ];

      commom_module = [
        inputs.home-manager.nixosModules.home-manager
        self.nixosModules.all-formats
        ({ ... }: { nixpkgs.overlays = nixpkgs-overlay; })
        ./nixos
        ./user
      ];

    in {
      main = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = commom_module ++ [
          inputs.vgpu4nixos.nixosModules.host
          ./host/main
        ];
      };

      rpi4 = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "aarch64-linux";
        modules = commom_module ++ [
          inputs.nixos-hardware.nixosModules.raspberry-pi-4
          ./host/rpi4
        ];
      };
    };
  };
}
