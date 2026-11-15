# ============================================================
# Konfiguration für Nexus
# Importiert alle Config files für den Host Nexus
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	imports = [
		./hardware-configuration-nexus.nix
		./configuration
		{ home-manager.users.corum = import ./home-nexus.nix; }
	];
}