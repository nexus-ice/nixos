# ============================================================
# ZRamSwap Config
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
}
