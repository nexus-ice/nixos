# ============================================================
# NIxOS Config für alle Hosts
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.auto-optimise-store = true;	
	nix.gc = {
		automatic = true;
		dates     = "weekly";
		options   = "--delete-older-than 30d";
	};
	system.stateVersion = "26.05";
}