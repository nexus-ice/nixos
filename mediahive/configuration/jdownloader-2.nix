# ============================================================
# JDownloader 2 Docker Configuration for MediaHive
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
}
