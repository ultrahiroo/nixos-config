# Command
## Update
```sh
nix flake update
```

## Check
```sh
nix flake check
```

## Install
```sh
sudo nixos-rebuild switch --flake .#main
```

## If Error When Switch
```sh
journalctl -xe --unit home-manager-one.service
```

## Reload systemd
```sh
sudo systemctl daemon-reload
```

## Clean
```sh
nix store gc
```

## Generate image
```sh
nix build .#nixosConfigurations.rpi4.config.formats.sd-aarch64
```

# TODO
- terminal launcher
- remove delay before clean

# Reference
## Opened issue
- https://github.com/NixOS/nix/issues/8881

## Example
- https://github.com/ryan4yin/nix-config/tree/i3-kickstarter

## Document
- https://nixos.org/manual/nixos/stable/#sec-modularity

## Wiki
- https://nixos.wiki/wiki/Nvidia
- https://nixos.wiki/wiki/Fcitx5
- https://nixos.wiki/wiki/KDE
- https://nixos.wiki/wiki/Nixos-rebuild
- https://nixos.wiki/wiki/Power_Management
- https://wiki.nixos.org/wiki/Secret_Service
- https://nixos.wiki/wiki/Keyboard_Layout_Customization
- https://wiki.nixos.org/wiki/Command_Shell
- https://nixos.wiki/wiki/Home_Manager
- https://nixos.wiki/wiki/Hyprland

## Issue
- https://discourse.nixos.org/t/why-cant-i-use-let-variables-in-flake-nix-inputs/39929

## HowTo
- https://unix.stackexchange.com/questions/500025/how-to-add-a-file-to-etc-in-nixos
- https://discourse.nixos.org/t/how-to-get-the-service-running-for-keyd/24991/3
- https://discourse.nixos.org/t/failed-to-start-home-manager-environment-for-user/50254
- https://discourse.nixos.org/t/how-to-automatically-unlock-kwallet-at-start-up/61308
- https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/inputs
- https://github.com/hyprwm/Hyprland/issues/4664
- https://journix.dev/posts/gaming-on-nixos/
