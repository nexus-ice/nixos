# ============================================================
# Home Manager Konfiguration – corum für Hive
# Zuständig für: Benutzerprogramme, Theme, GNOME-Einstellungen
# Systemweites → configuration.nix
# ============================================================

# pkgs-unstable wird von flake.nix via extraSpecialArgs übergeben
{ config, pkgs, pkgs-unstable, ... }:
{
	
	# ─────────────────────────────────────────
	# Benutzerprogramme
	# Pakete aus unstable: pkgs-unstable.paketname
	# Pakete aus stable:   pkgs.paketname
	# ─────────────────────────────────────────
	home.packages = [
		pkgs.keepassxc
	];
	programs.firefox.enable = true;


}
