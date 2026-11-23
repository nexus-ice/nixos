# ===============================================================
# Importiert alle Home Config Files für alle Desktops
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
    ./software.nix
  ];
}
