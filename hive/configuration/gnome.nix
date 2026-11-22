# ============================================================
# Gnome Desktop Environment Configuration
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "corum";
  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  environment.gnome.excludePackages = (
    with pkgs;
    [
      yelp # help viewer
      epiphany # web browser
      geary # email client
      snapshot # Camera tool
      decibels # audio player
      simple-scan # document scanner
      totem # video player
      gnome-maps
      gnome-tour
      gnome-contacts
      gnome-weather
      gnome-music
      gnome-clocks
      gnome-characters
      gnome-calendar
    ]
  );
}
