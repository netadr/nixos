{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.hardware.audio;
in {
  options.modules.hardware.audio = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
