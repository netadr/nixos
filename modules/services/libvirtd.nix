{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.services.libvirtd;
in {
  options.modules.services.libvirtd = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.extraGroups = [ "libvirtd" ];

    virtualisation.libvirtd = {
      enable = true;
    };
  };
}
