{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.desktop.gnome;
in {
  options.modules.desktop.gnome = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;

    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.gdm.wayland = true;

    user.packages = with pkgs; [
      gnome.gnome-keyring
      gnome.gnome-terminal
      gnome.gnome-tweaks
      gnome.nautilus
    ];

    user.packages = with pkgs; [
      corefonts
      ubuntu_font_family
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      dejavu_fonts
      jetbrains-mono
    ];
  };
}

