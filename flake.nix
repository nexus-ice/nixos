# ============================================================
# NixOS Multi Host Config
# Aufruf: sudo nixos-rebuild switch --flake .#hostname
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

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      # Unstable-Pakete mit allowUnfree (für Obsidian, xmind etc.)
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      # Gemeinsame Konfiguration für alle Systeme
      modules-common = [
        ./common
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          # pkgs-unstable an home.nix weitergeben
          home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
        }
      ];
      # Gemeinsame Konfiguration für alle Desktops
      modules-desktop = [
        ./desktop
      ];
      # Gemeinsame Konfiguration für alle Server
      modules-server = [
        ./server
      ];
    in
    {
      nixosConfigurations = {

        # --- Konfiguration für Hive ---
        hive = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules =
            modules-common
            ++ modules-desktop
            ++ [
              ./hive
            ];
        };

        # --- Konfiguration für nexus ---
        nexus = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules =
            modules-common
            ++ modules-desktop
            ++ [
              ./nexus
            ];
        };

        # --- Konfiguration für Vault ---
        vault = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules =
            modules-common
            ++ modules-server
            ++ [
              ./vault/hardware-configuration-vault.nix
              { networking.hostName = "vault"; }
              ./vault/configuration-vault.nix
              { home-manager.users.corum = import ./vault/home-vault.nix; }
            ];
        };

        # --- Konfiguration für MediaHive ---
        mediahive = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules =
            modules-common
            ++ modules-server
            ++ [
              ./mediahive/hardware-configuration-mediahive.nix
              { networking.hostName = "mediahive"; }
              ./mediahive/configuration-mediahive.nix
              #{ home-manager.users.corum = import ./mediahive/home-mediahive.nix; }
            ];
        };
      };
    };
}
