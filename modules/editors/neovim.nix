{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.editors.neovim;
in {
  options.modules.editors.neovim = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    home._.programs.neovim = {
      enable = true;
      vimAlias = true;
    };
  };
}
