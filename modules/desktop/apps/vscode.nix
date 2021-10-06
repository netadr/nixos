{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.desktop.apps.vscode;
in {
  options.modules.desktop.apps.vscode = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    home._.programs.vscode = {
      enable = true;
      extensions = with pkgs; [
        vscode-extensions.cpptools
        vscode-extensions.python
      ];
    };
  };
}
