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
    { networking.hostName = "nexus"; }
    ./hardware-configuration.nix
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
