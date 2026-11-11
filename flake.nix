# ============================================================
# NixOS Multi Host Config
# Zuständig für: Zusammenstellen der einzeln System
# ============================================================
{
	description = "NixOS Multi-Host Konfiguration";
	inputs = {
		# Stabiler Kanal – für System, GNOME, Erweiterungen
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		# Unstable-Kanal – für ausgewählte Benutzerpakete und Firefox
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
	let
		system = "x86_64-linux";
		# Unstable-Pakete mit allowUnfree (für Obsidian, xmind etc.)
		pkgs-unstable = import nixpkgs-unstable {
			inherit system;
			config.allowUnfree = true;
		};
		# Gemeinsame Konfiguration für alle Systeme
		common-modules = [
			./configuration.nix
			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
        			home-manager.backupFileExtension = "backup";

				# pkgs-unstable an home.nix weitergeben
				home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
			}
		];
	in {
		nixosConfigurations = {

			# --- Konfiguration für Hive ---
			# Dateiname: hardware-configuration.nix
			# Aufruf: sudo nixos-rebuild switch --flake .#hive
			hive = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit pkgs-unstable; };
				modules = common-modules ++ [
					./hive/hardware-configuration.nix
					{ networking.hostName = "hive"; }
					./hive/configuration.nix
					#{ home-manager.users.corum = import ./home.nix; }
				];
			};
		};
	};
}
