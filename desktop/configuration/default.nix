# ============================================================
# Importiert alle Config Files für alle Desktops
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
    ./drucker.nix
    ./sound.nix
  ];
}
