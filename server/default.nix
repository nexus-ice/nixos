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
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
