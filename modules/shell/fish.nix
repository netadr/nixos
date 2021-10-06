{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.shell.fish;
in {
  options.modules.shell.fish = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.shell = pkgs.fish;

    home._.programs.fish = {
      enable = true;
    };
  };
}
