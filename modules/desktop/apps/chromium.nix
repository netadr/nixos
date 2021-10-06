{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.desktop.apps.chromium;
in {
  options.modules.desktop.apps.chromium = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    home._.programs.chromium = {
      enable = true;
      extensions = [
          { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      ];
    };
  };
}

