# ============================================================
# Netzwerk Config für alle Hosts
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  networking.networkmanager.enable = true;
  networking.hosts = {
    "192.168.2.1" = [ "speedport.ip" ];
    "192.168.2.2" = [ "mediahive" ];
    "192.168.2.3" = [ "vault" ];
  };
  networking.firewall.enable = true;
}
