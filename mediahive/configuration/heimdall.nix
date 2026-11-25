# ============================================================
# Heimdall Docker Configuration for MediaHive
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
    heimdall = {
      autoStart = true;
      image = "lscr.io/linuxserver/heimdall:latest";
      environment = {
        PUID = "1000";
        PGID = "100";
        TZ = "Etc/UTC+1";
        ALLOW_INTERNAL_REQUESTS = "false"; # optional
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

}
