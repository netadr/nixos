{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.desktop.gtk;
in {
  options.modules.desktop.gtk = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    home._.gtk = {
      enable = true;
      iconTheme.package = pkgs.papirus-icon-theme;
      iconTheme.name = "Papirus-Dark";
      theme.package = pkgs.gnome.gnome-themes-standard;
      theme.name = "Adwaita-dark";
    };
  };
}

