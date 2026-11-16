# ============================================================
# Importiert alle Config files für den alle Hosts
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	imports = [
		./configuration
		{ home-manager.users.corum = import ./home; }
	];
}