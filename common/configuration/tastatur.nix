# ============================================================
# Tastatur Config für alle Hosts
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	services.xserver.xkb = {
		layout = "de";
		variant = "";
	};
	console.keyMap = "de";
}