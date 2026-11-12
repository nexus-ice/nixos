# ============================================================
# NixOS Systemkonfiguration alle Systeme
# Zuständig für: Hardware, System, Dienste, Desktop-Umgebung
# Benutzerspezifisches → home.nix
# ============================================================

# pkgs-unstable wird von flake.nix via specialArgs übergeben
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	# ─────────────────────────────────────────
	# Bootloader
	# ─────────────────────────────────────────
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# ─────────────────────────────────────────
	# Netzwerk
	# ─────────────────────────────────────────
	networking.networkmanager.enable = true;
	networking.hosts = {
		"192.168.2.1" = ["speedport.ip"];
		"192.168.2.2" = ["mediahive"];
		"192.168.2.3" = ["vault"];
	};
	networking.firewall.enable = true;

	# ─────────────────────────────────────────
	# Sprache, Zeit & Region
	# ─────────────────────────────────────────
	time.timeZone = "Europe/Berlin";
	i18n.defaultLocale = "de_DE.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "de_DE.UTF-8";
		LC_IDENTIFICATION = "de_DE.UTF-8";
		LC_MEASUREMENT = "de_DE.UTF-8";
		LC_MONETARY = "de_DE.UTF-8";
		LC_NAME = "de_DE.UTF-8";
		LC_NUMERIC = "de_DE.UTF-8";
		LC_PAPER = "de_DE.UTF-8";
		LC_TELEPHONE = "de_DE.UTF-8";
		LC_TIME = "de_DE.UTF-8";
	};
	
	# ─────────────────────────────────────────
	# Tastaturlayout Deutsch
	# ─────────────────────────────────────────
	services.xserver.xkb = {
		layout = "de";
		variant = "";
	};
	console.keyMap = "de";
	
	# ─────────────────────────────────────────
	# Benutzer-Account
	# ─────────────────────────────────────────
	users.users."corum" = {
		isNormalUser = true;
		description = "corum";
		extraGroups = [ "networkmanager" "wheel" ];
	};
	
	# ─────────────────────────────────────────
	# Installierte Software
	# ─────────────────────────────────────────
	environment.systemPackages = with pkgs; [
		mc 
		#just 
	];

	# ─────────────────────────────────────────
	# GIT 
	# ─────────────────────────────────────────
  	#programs.git.enable = true;
  	#programs.git.config = {
  	#	user.name = "nexus-ice";
  	#	user.email = "nexusice1234@googlemail.com";
  	#};
  	
	# ─────────────────────────────────────────
	# SSH 
	# ─────────────────────────────────────────
	services.openssh.enable = true;
	services.openssh.allowSFTP = true;
	services.openssh.openFirewall = true;
	services.openssh.settings.PermitRootLogin = "yes";
	
	# ─────────────────────────────────────────
	# Nix-Einstellungen
	# ─────────────────────────────────────────
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.auto-optimise-store = true;	
	nix.gc = {
		automatic = true;
		dates     = "weekly";
		options   = "--delete-older-than 30d";
	};

	# ─────────────────────────────────────────
	# NixOS-Version (nicht ändern!)
	# ─────────────────────────────────────────
	system.stateVersion = "26.05";

}
