# ============================================================
# NixOS Systemkonfiguration Vault
# Zuständig für: Hardware, System, Dienste, Desktop-Umgebung
# Benutzerspezifisches → home.nix
# ============================================================

# pkgs-unstable wird von flake.nix via specialArgs übergeben
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	# ─────────────────────────────────────────
	# Bootloader
	# ─────────────────────────────────────────
	boot.loader.systemd-boot.enable = lib.mkForce false;
	boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
	boot.loader.grub.enable = true;
  	boot.loader.grub.device = "/dev/sdf";
  	boot.loader.grub.useOSProber = true;

	# ─────────────────────────────────────────
	# Netzwerk
	# ─────────────────────────────────────────
	networking = {
		interfaces = {
			enp2s0 = {
				ipv4.addresses = [{
        				address = "192.168.2.3";
        				prefixLength = 24;
      				}];
      				wakeOnLan.enable = true;
    			};
  		};
  		defaultGateway.address = "192.168.2.1";
  		nameservers = ["192.168.2.1"];
  		firewall = {
    			allowedUDPPorts = [ 9 ];
  		};
	};

	# ─────────────────────────────────────────
	# Filesystem
	# ─────────────────────────────────────────
	fileSystems."/mnt/HDD1" = {
		device = "/dev/disk/by-uuid/db496c49-b17f-41af-b09f-60aa545158f8";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD2" = {
		device = "/dev/disk/by-uuid/575aaefa-40a8-4147-9980-60bf4101dc2c";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD3" = {
		device = "/dev/disk/by-uuid/119488a0-2bae-492c-9387-019fe269a85a";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD4" = {
		device = "/dev/disk/by-uuid/3357d84d-803e-4ddd-9913-d5ee54b735b2";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD5" = {
		device = "/dev/disk/by-uuid/1aac9fbe-abad-4267-ab12-73d29665e59c";
		fsType = "ext4";
	};
	
}
