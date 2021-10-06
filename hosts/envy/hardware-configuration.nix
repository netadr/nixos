{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };

    kernelModules = [
      "kvm-intel"
    ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/root";
    fsType = "btrfs";
    options = [
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };
}
