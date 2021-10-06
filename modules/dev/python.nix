{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.dev.python;
in {
  options.modules.dev.python = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      python39
    ];
  };
}
