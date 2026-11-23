# ============================================================
# Importiert alle Config files für den Host Nexus
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
    ./xfce.nix
    ./zram_swap.nix
  ];
}
