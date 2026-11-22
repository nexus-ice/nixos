# ===============================================================
# Importiert alle Config Files für den Host Hive
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
    { networking.hostName = "hive"; }
    ./hardware-configuration.nix
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
