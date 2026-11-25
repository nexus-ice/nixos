# ============================================================
# Audiobookshelf Configuration for MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  services.audiobookshelf = {
    enable = true;
    host = "192.168.2.2";
    user = "corum";
    group = "users";
    port = 15000;
    openFirewall = true;
  };
}
