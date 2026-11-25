# ============================================================
# Importiert alle Config files für den Host Vault
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
    { networking.hostName = "vault"; }
    ./hardware-configuration.nix
    ./configuration
    { home-manager.users.corum = import ./home; }
  ];
}
