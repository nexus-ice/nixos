# ============================================================
# Jellyfin Konfiguration für den Host MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
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
}
