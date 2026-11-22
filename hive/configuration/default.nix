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
    ./sound.nix
    ./drucker.nix
    ./gnome.nix
    ./hwclock_local.nix
  ];
}
