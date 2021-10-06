{ config, options, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.dev.rust;
in {
  options.modules.dev.rust = {
    enable = _.mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      rustup
    ];

    environment.shellAliases = {
      rs = "rustc";
      rsp = "rustup";
      ca = "cargo";
    };
  };
}
