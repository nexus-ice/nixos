# ============================================================
# Importiert alle Config Files für den Host Vault
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
    ./bootloader.nix
    ./netzwerk.nix
    ./filesystem.nix
  ];
}
