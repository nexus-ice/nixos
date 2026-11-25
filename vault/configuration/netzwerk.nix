# ============================================================
# Netzwerk Konfiguration für den Host Vault
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  networking = {
    interfaces = {
      enp2s0 = {
        ipv4.addresses = [
          {
            address = "192.168.2.3";
            prefixLength = 24;
          }
        ];
        wakeOnLan.enable = true;
      };
    };
    defaultGateway.address = "192.168.2.1";
    nameservers = [ "192.168.2.1" ];
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
  };
}
