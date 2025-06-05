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
```sh
sudo nixos-rebuild switch --flake .#rpi4-disko
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

```sh
ls -la /nix/var/nix/gcroots/auto
```

```sh
sudo nix-collect-garbage --delete-older-than 3d
nix-collect-garbage --delete-older-than 3d
```

```sh
sudo nix-collect-garbage --delete-old
nix-collect-garbage --delete-old
```

## Generate image
### nixos-generator
```sh
nix build .#nixosConfigurations.rpi4.config.formats.sd-aarch64
```
```sh
nix build .#nixosConfigurations.rpi4.config.formats.sd-aarch64-btrfs
```
### disko
```sh
nix build .#nixosConfigurations.rpi4-disko-btrfs.config.system.build.diskoImagesScript
sudo ./result
```
```sh
sudo disko-install --flake '.#rpi4-disko-btrfs' --disk main /dev/sde
```

# Feature
- nixos-generators
  - [ ] btrfs
  - [x] ext4
- disko
  - [x] btrfs
  - [ ] bcachefs
  - [x] xfs

# TODO
1. config maomaowm
1. fix rpi4-btrfs: does not boot: btrfs subvolume is not defined at boot?
1. fix rpi4-btrfs: image generating is too slow
1. submodule is too slow

# Reference
## Opened issue
- https://github.com/NixOS/nix/issues/8881
- https://github.com/NixOS/nix/issues/8508

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
- https://github.com/NixOS/nix/issues/5532

## HowTo
- https://unix.stackexchange.com/questions/500025/how-to-add-a-file-to-etc-in-nixos
- https://discourse.nixos.org/t/how-to-get-the-service-running-for-keyd/24991/3
- https://discourse.nixos.org/t/failed-to-start-home-manager-environment-for-user/50254
- https://discourse.nixos.org/t/how-to-automatically-unlock-kwallet-at-start-up/61308
- https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/inputs
- https://github.com/hyprwm/Hyprland/issues/4664
- https://journix.dev/posts/gaming-on-nixos/
- https://discourse.nixos.org/t/nix-2-27-0-released/62003
