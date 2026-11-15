# ============================================================
# Konfiguration für Nexus
# Importiert alle Config files für den Host Nexus
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	imports = [
		./configuration-nexus.nix
		./ZRamSwap.nix
	];
}