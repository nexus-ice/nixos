# ============================================================
# Git Config für user corum auf alle Hosts
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  home.username = "corum";
  home.homeDirectory = "/home/corum";
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
