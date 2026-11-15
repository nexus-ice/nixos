{ config, pkgs, pkgs-unstable, lib, ... }:
{
	imports = [
		./hardware-configuration-vault.nix
		./configuration-vault.nix
		{ home-manager.users.corum = import ./home-vault.nix; }
	];
}