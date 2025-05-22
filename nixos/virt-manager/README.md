# Command
## Setup
```sh
sudo virsh net-autostart default
sudo virsh net-start default
```
## Reload Config
```sh
sudo systemctl start libvirtd-config.service
```

# Reference
- https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu
