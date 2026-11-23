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
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
