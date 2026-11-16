# ============================================================
# Benutzer Account Config für alle Hosts
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	users.users."corum" = {
		isNormalUser = true;
		description = "corum";
		extraGroups = [ "networkmanager" "wheel" ];
	};
}