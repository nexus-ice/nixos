# ============================================================
# Importiert alle Home Config files für den Host Nexus
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  imports = [
    ./git.nix
    ./software.nix
    ./home-manager.nix
  ];
}
