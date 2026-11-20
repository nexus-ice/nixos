# ============================================================
# Desktop Environment mit XFCE
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
}
