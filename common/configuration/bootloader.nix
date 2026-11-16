# ============================================================
# Bootloader Config für alle Hosts
# ============================================================
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.systemd-boot.configurationLimit = 5;
	boot.loader.efi.canTouchEfiVariables = true;
}