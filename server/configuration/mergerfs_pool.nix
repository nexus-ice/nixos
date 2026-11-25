# ============================================================
# Mergerfs Pool
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [ mergerfs ];
  fileSystems."/mnt/pool" = {
    fsType = "fuse.mergerfs";
    device = "/mnt/HDD*";
    options = [
      "defaults"
      "allow_other"
    ];
  };
}
