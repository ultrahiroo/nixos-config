{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
            inherit system;
          }
        );
    in
    {
      packages = forAllSystems (
        { pkgs, system }:
        {
          default =
            let
            in
            pkgs.writeShellApplication {
              name = "qemu-test-image";
              runtimeInputs = with pkgs; [
                qemu
              ];
              text = ''
                if [ -z "$1" ]; then
                  echo "Usage: $0 <path-to-boot-image>"
                  exit 1
                fi
                tmpFile=$(mktemp /tmp/test-image.XXXXXX)
                trap 'rm -f $tmpFile' EXIT
                cp "$1" "$tmpFile"
                qemu-system-x86_64 \
                  -enable-kvm \
                  -m 2G \
                  -cpu max \
                  -smp 2 \
                  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
                  -device virtio-net-pci,netdev=net0 \
                  -drive if=pflash,format=raw,readonly=on,file=${pkgs.OVMF.firmware} \
                  -drive if=pflash,format=raw,readonly=on,file=${pkgs.OVMF.variables} \
                  -drive if=virtio,format=raw,file="$tmpFile" \
                  # -nographic
              '';
            };
        }
      );
    };
}
