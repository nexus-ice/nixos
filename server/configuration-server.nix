# ============================================================
# NixOS Systemkonfiguration alle Server
# Zuständig für: Hardware, System, Dienste, Desktop-Umgebung
# Benutzerspezifisches → home.nix
# ============================================================

# pkgs-unstable wird von flake.nix via specialArgs übergeben
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	# ─────────────────────────────────────────
	# Mergerfs Pool
	# ─────────────────────────────────────────
	environment.systemPackages = with pkgs; [ mergerfs ];
	fileSystems."/mnt/pool" = {
		fsType = "fuse.mergerfs";
		device = "/mnt/HDD*";
		options = ["defaults" "allow_other"];
	};
	
	# ─────────────────────────────────────────
	# Samba
	# ─────────────────────────────────────────
	services.samba = { 
		enable = true;
		openFirewall = true;
		settings = {
  			global = {
 				"workgroup" = "WORKGROUP";
				"force user" = "corum";
				"guest account" = "corum";
    			};
			Storage =  {
      				"path" = "/mnt/pool/";
      				"browseable" = "yes";
      				"writeable" = "yes";
				"public" = "yes";
      				"guest ok" = "yes";
				# Erzwingt, dass neu erstellte Ordner/Dateien beschreibbar bleiben:
        			"create mask" = "0777";
        			"directory mask" = "0777";
        			"force create mode" = "0777";
        			"force directory mode" = "0777";
    			};
  			NixOs-Config = {
  				"path" = "/home/corum/nixos-config/";
      				"browseable" = "yes";
      				"writeable" = "yes";
				"public" = "yes";
      				"guest ok" = "yes";
				# Auch hier für die Configs aktivieren:
        			"create mask" = "0775";
        			"directory mask" = "0775";
        			"force create mode" = "0775";
        			"force directory mode" = "0775";
  			};
		};
	};
	services.samba-wsdd = {
		enable = true;
		openFirewall = true;
	};
	networking.firewall.allowPing = true;
	
}
