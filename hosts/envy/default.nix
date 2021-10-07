{ config, lib, pkgs, modulesPath, inputs, ... }:

let
  inherit (lib._) enable;
in {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];

  time.timeZone = "US/Eastern";
  networking.hostName = "envy";

  environment.systemPackages = with pkgs; [
    sof-firmware
  ];

  modules = {
    desktop = {
      gnome.enable = true;
      gtk.enable = true;
      apps = {
        chromium.enable = true;
        virt-manager.enable = true;
        vscode.enable = true;
      };
    };
    dev = {
      c.enable = true;
      python.enable = true;
      rust.enable = true;
    };
    editors = {
      neovim.enable = true;
    };
    hardware = {
      audio.enable = true;
    };
    services = {
      libvirtd.enable = true;
      networkmanager.enable = true;
    };
  };
}
