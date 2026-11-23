# ============================================================
# Importiert alle Config files für den Host Hive
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
    ./gnome.nix
    ./hwclock_local.nix
  ];
}
