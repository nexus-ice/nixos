# ============================================================
# Bootloader Configuration for Vault
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdf";
  boot.loader.grub.useOSProber = true;
}
