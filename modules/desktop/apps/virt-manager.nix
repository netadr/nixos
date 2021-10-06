{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.desktop.apps.virt-manager;
in {
  options.modules.desktop.apps.virt-manager = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qemu
    ];

    user.packages = with pkgs; [
      virt-manager
    ];
  };
}

