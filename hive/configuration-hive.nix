# ============================================================
# NixOS Systemkonfiguration Hive
# Zuständig für: Hardware, System, Dienste, Desktop-Umgebung
# Benutzerspezifisches → home.nix
# ============================================================

# pkgs-unstable wird von flake.nix via specialArgs übergeben
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	# ─────────────────────────────────────────
	# GNOME Desktop Environment
	# ─────────────────────────────────────────
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;
	
	# ─────────────────────────────────────────
	# Cups Drucker
	# ─────────────────────────────────────────
	services.printing.enable = true;

	# ─────────────────────────────────────────
	# Sound Pipewire
	# ─────────────────────────────────────────
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# ─────────────────────────────────────────
	# Gnome Auto Login
	# ─────────────────────────────────────────
  	services.displayManager.autoLogin.enable = true;
  	services.displayManager.autoLogin.user = "corum";
  	# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  	systemd.services."getty@tty1".enable = false;
  	systemd.services."autovt@tty1".enable = false;
	
	# ─────────────────────────────────────────
	# Gnome exclude Packages 
	# ─────────────────────────────────────────
	environment.gnome.excludePackages = (with pkgs; [
		yelp		# help viewer
		epiphany    	# web browser		
		geary 		# email client
		snapshot 	# Camera tool
		decibels 	# audio player
		simple-scan 	# document scanner
		totem 		# video player
		gnome-maps
		gnome-tour		
		gnome-contacts
		gnome-weather
		gnome-music
		gnome-clocks		
		gnome-characters
		gnome-calendar
	]);
	
	# ─────────────────────────────────────────
	# Bios Uhr auf local setzen wegen win 11
	# ─────────────────────────────────────────
	time.hardwareClockInLocalTime = true;
}


