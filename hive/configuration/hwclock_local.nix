# ============================================================
# Bios Uhr auf local setzen wegen win 11
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  time.hardwareClockInLocalTime = true;
}
