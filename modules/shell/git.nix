{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.shell.git;
in {
  options.modules.shell.git = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    home._.programs.git = {
      enable = true;
      userName = "Clayton Gilmer";
      userEmail = "42688647+claytonjgilmer@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
