# ============================================================
# Drucker Config (Cups)
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
