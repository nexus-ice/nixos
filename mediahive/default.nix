# ============================================================
# Importiert alle Config files für den Host MediaHive
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
    { networking.hostName = "mediahive"; }
    ./hardware-configuration.nix
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
