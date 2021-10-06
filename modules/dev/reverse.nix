{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.dev.reverse;
in {
  options.modules.dev.reverse = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      xxd
      flare-floss
    ];
  };
}
