# Command
```sh
nix-store --add-fixed sha256 NVIDIA-GRID-Linux-KVM/NVIDIA-GRID-Linux-KVM-550.90.05-550.90.07-552.74.zip
```

# Check List
- [ ] vgpu_16_0: vgpu4nixos does not support
- [ ] vgpu_16_1: vgpu4nixos does not support
- [x] vgpu_16_2: host has the same behavior as vgpu_16_5
- [x] vgpu_16_5: host does not work: mdevctl types does not print: 5月 21 02:10:52 main kernel: [drm:__nv_drm_gem_nvkms_memory_prime_get_sg_table [nvidia_drm]] *ERROR* [nvidia-drm] [GPU ID 0x00000100] Cannot create sg_table for NvKmsKapiMemory 0x00000000e819692a
- [ ] vgpu_17_1: vgpu4nixos does not support
- [x] vgpu_17_3: host works but vm dose not work

# Check List
- /etc/nvidia/vgpu/vgpuConfig.xml

# Reference
- https://github.com/mrzenc/vgpu4nixos
- https://github.com/VGPU-Community-Drivers/vGPU-Unlock-patcher
- https://docs.nvidia.com/vgpu/16.0/grid-vgpu-release-notes-generic-linux-kvm/index.html
- https://docs.nvidia.com/vgpu/17.0/grid-vgpu-release-notes-generic-linux-kvm/index.html
- https://archive.org/download/NVIDIA-VGPU-Driver-Archive/NVIDIA-GRID-vGPU-Linux-KVM-Drivers/
- https://documentation.ubuntu.com/server/how-to/graphics/gpu-virtualization-with-qemu-kvm/index.html
