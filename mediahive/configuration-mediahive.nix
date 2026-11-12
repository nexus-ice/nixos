# ============================================================
# NixOS Systemkonfiguration alle Systeme
# Zuständig für: Hardware, System, Dienste, Desktop-Umgebung
# Benutzerspezifisches → home.nix
# ============================================================

# pkgs-unstable wird von flake.nix via specialArgs übergeben
{ config, pkgs, pkgs-unstable, lib, ... }:
{
	# ─────────────────────────────────────────
	# Netzwerk
	# ─────────────────────────────────────────
	networking = {
  		interfaces = {
    			enp4s0 = {
      				ipv4.addresses = [{
        				address = "192.168.2.2";
        				prefixLength = 24;
      				}];
      				wakeOnLan.enable = true;
    			};
  		};
  		defaultGateway.address = "192.168.2.1";
  		nameservers = ["192.168.2.2"];
  		firewall = {
    			allowedUDPPorts = [ 9 53 ];
    			allowedTCPPorts = [ 8080 53 ];
  		};
	};
  	
  	# ─────────────────────────────────────────
	# Filesystem
	# ─────────────────────────────────────────
	fileSystems."/mnt/HDD1" = {
		device = "/dev/disk/by-uuid/19a0fa3c-178f-4acc-a089-aa9506d76d70";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD2" = {
		device = "/dev/disk/by-uuid/294f8910-98f5-4635-8e3e-1faf597f304e";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD3" = {
		device = "/dev/disk/by-uuid/c179843d-2ded-4239-becf-55a0d7a0b2de";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD4" = {
		device = "/dev/disk/by-uuid/74713556-d11e-4760-bd54-e72395a18ac1";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD5" = {
		device = "/dev/disk/by-uuid/841f9deb-bddd-42e6-bd1f-0070067d8802";
		fsType = "ext4";
	};

	fileSystems."/mnt/HDD6" = {
		device = "/dev/disk/by-uuid/0cf68225-3b91-4c7a-b250-e42bc999cd5d";
		fsType = "ext4";
	};
	
	# ─────────────────────────────────────────
	# Adguard Home
	# ─────────────────────────────────────────
	services.adguardhome = {
		enable = true;
        	openFirewall = true;
        	mutableSettings = true;
    	};
	#networking.firewall.allowedTCPPorts = [ 8080 53 ];
	#networking.firewall.allowedUDPPorts = [ 53 ];
	services.resolved.enable = false;
	
	# ─────────────────────────────────────────
	# Jellyfin
	# ─────────────────────────────────────────
	services.jellyfin = {
    		enable = true;
    		openFirewall = true;
    		user = "corum";
    		group = "users";
  		};
  	environment.systemPackages = [
    		pkgs.jellyfin
    		pkgs.jellyfin-web
    		pkgs.jellyfin-ffmpeg
  	];
  	
  	# ─────────────────────────────────────────
	# Audiobookshelf
	# ─────────────────────────────────────────
  	services.audiobookshelf = {
    		enable = true;
    		host = "192.168.2.2";
    		user = "corum";
    		group = "users";
    		port = 15000;
    		openFirewall = true;
  	};
  	
  	# ─────────────────────────────────────────
	# Docker
	# ─────────────────────────────────────────
	#virtualisation.docker.enable = true;
	#environment.systemPackages = with pkgs; [ docker-compose ];
	#users.users.${var.user}.extraGroups = [ "docker" ];
	#networking.firewall.allowedTCPPorts = [ 8090 ];
	
	# ─────────────────────────────────────────
	# Heimdall Docker
	# ─────────────────────────────────────────
	virtualisation.oci-containers.containers = {
		heimdall = {
			autoStart = true;
    			image = "lscr.io/linuxserver/heimdall:latest";
    			environment = {
      				PUID = "1000";
      				PGID = "100";
      				TZ = "Etc/UTC+1";
      				ALLOW_INTERNAL_REQUESTS = "false" #optional
      			};
      			ports = [
      				"80:80"
      				"443:443"
      			];
      			volumes = [
				"/home/corum/.docker/heimdall/config:/config"
			];
		};
	};
	
	# ─────────────────────────────────────────
	# JDownloader 2 Docker
	# ─────────────────────────────────────────
	virtualisation.oci-containers.containers = {
		jdownloader-2 = {
			autoStart = true;
    			image = "jlesage/jdownloader-2";
    			environment = {
      				USER_ID = "1000";
      				GROUP_ID = "100";
      			};
      			ports = [
      				"5800:5800"
      			];
      			volumes = [
				"/home/corum/.docker/jdownloader2/config:/config:rw"
				"/mnt/pool/Downloads:/output:rw"
			];
		};
	};
	
	# ─────────────────────────────────────────
	# Radarr Docker
	# ─────────────────────────────────────────
	virtualisation.oci-containers.containers = {
		radarr = {
			autoStart = true;
    			image = "lscr.io/linuxserver/radarr:latest";
    			environment = {
      				PUID = "1000";
      				PGID = "100";
      				TZ = "Etc/UTC+1";
      			};
      			ports = [
      				"7878:7878"
      			];
      			volumes = [
				"/home/corum/.docker/radarr/data:/config"
				"/mnt/pool/Filme:/movies" #optional
				"/mnt/pool/Downloads:/downloads" #optional
			];
		};
	};
	
	# ─────────────────────────────────────────
	# Sonarr Docker
	# ─────────────────────────────────────────
	virtualisation.oci-containers.containers = {
		sonarr = {
			autoStart = true;
    			image = "lscr.io/linuxserver/sonarr:latest";
    			environment = {
      				PUID = "1000";
      				PGID = "100";
      				TZ = "Etc/UTC+1";
      			};
      			ports = [
      				"8989:8989"
      			];
      			volumes = [
				"/home/corum/.docker/sonarr/data:/config"
				"/mnt/pool/Serien:/tv" #optional
				"/mnt/pool/Downloads:/downloads" #optional
			];
		};
	};
	
	# ─────────────────────────────────────────
	# Upsnap Docker
	# ─────────────────────────────────────────
	virtualisation.oci-containers.containers = {
		upsnap = {
    			image = "ghcr.io/seriousm4x/upsnap:5";
    			autoStart = true;
    			environment = {
    				TZ = "Europe/Berlin";
    				UPSNAP_HTTP_LISTEN = "0.0.0.0:8090";
    			};
    			volumes = [
    				"/home/corum/.docker/upsnap/data:/app/pb_data"
    			];
    			extraOptions = [
    				"--network=host"
    				"--cap-drop=ALL"
    				"--cap-add=NET_RAW"
    			];
    		};
    	};
}
