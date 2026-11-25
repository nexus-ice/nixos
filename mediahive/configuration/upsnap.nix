# ============================================================
# Upsnap Docker Configuration for MediaHive
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
  networking.firewall.allowedTCPPorts = [ 8090 ];
}
