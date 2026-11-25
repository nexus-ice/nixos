# ============================================================
# Importiert alle Config Files für alle Server
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
    ./mergerfs_pool.nix
    ./samba.nix
  ];
}
