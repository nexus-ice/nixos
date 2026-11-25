# ============================================================
# Radarr Docker Configuration for MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
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
        "/mnt/pool/Filme:/movies" # optional
        "/mnt/pool/Downloads:/downloads" # optional
      ];
    };
  };
}
