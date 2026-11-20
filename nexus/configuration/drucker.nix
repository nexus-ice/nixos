# ============================================================
# Drucker Config mit Cups
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  services.printing.enable = true;
}
