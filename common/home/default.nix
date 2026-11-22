# ===============================================================
# Importiert alle Home Config Files für user corum auf alle Hosts
# ===============================================================
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
