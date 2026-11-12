# ============================================================
# Home Manager Konfiguration – corum
# Zuständig für: Benutzerprogramme, Theme, GNOME-Einstellungen
# Systemweites → configuration.nix
# ============================================================

# pkgs-unstable wird von flake.nix via extraSpecialArgs übergeben
{ config, pkgs, pkgs-unstable, ... }:
{
	# ─────────────────────────────────────────
	# Grundeinstellungen Home Manager
	# ─────────────────────────────────────────
	home.username      = "corum";
	home.homeDirectory = "/home/corum";

	# ─────────────────────────────────────────
	# Home Manager Version
	# ─────────────────────────────────────────
	home.stateVersion = "26.05";

	# ─────────────────────────────────────────
	# Home Manager sich selbst verwalten lassen
	# ─────────────────────────────────────────
	programs.home-manager.enable = true;

	# ─────────────────────────────────────────
	# Benutzerprogramme
	# Pakete aus unstable: pkgs-unstable.paketname
	# Pakete aus stable:   pkgs.paketname
	# ─────────────────────────────────────────
	home.packages = [
		pkgs.just
	];

	# ─────────────────────────────────────────
	# Git – Benutzerkonfiguration
	# ─────────────────────────────────────────
	programs.git = {
		enable = true;
		settings = {
			user.email = "nexusice1234@googlemail.com";
			user.name  = "nexus-ice";
		};
	};

}
