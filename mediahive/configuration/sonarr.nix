# ============================================================
# Sonarr Docker Configuration for MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  # ─────────────────────────────────────────
  #
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
        "/mnt/pool/Serien:/tv" # optional
        "/mnt/pool/Downloads:/downloads" # optional
      ];
    };
  };
}
