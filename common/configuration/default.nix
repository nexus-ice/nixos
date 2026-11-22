# ============================================================
# Importiert alle Config Files für alle Hosts
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
    ./sprache_region.nix
    ./ssh.nix
    ./tastatur.nix
    ./benutzer.nix
    ./software.nix
    ./nixos_config.nix
  ];
}
