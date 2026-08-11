{ pkg, ... }:

{
  # QEMU/KVM hypervisor
  virtualisation.libvirtd.enable = true;

  # if you use libvirtd on a desktop environment
  programs.virt-manager.enable = true;

  # guest utilities
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
