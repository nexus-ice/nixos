{ config, pkgs, pkgs-unstable, lib, ... }:
{
	imports = [
		./hardware-configuration-nexus.nix
		./configuration-nexus.nix
		{ home-manager.users.corum = import ./home-nexus.nix; }
	];
}