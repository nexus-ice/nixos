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
	# Systemweite Programme
	# ─────────────────────────────────────────
	programs.firefox.enable = true;
	
	# ─────────────────────────────────────────
	# Bios Uhr auf local setzen wegen win 11
	# ─────────────────────────────────────────
	time.hardwareClockInLocalTime = true;
}


