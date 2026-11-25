# ============================================================
# Importiert alle Config Files für den Host MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  imports = [
    ./adguard_home.nix
    ./audiobookshelf.nix
    ./filesystem.nix
    ./heimdall.nix
    ./jdownloader-2.nix
    ./jellyfin.nix
    ./netzwerk.nix
    ./radarr.nix
    ./sonarr.nix
    ./upsnap.nix
  ];
}
