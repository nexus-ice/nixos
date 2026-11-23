# ============================================================
# Software
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  # ─────────────────────────────────────────
  # Benutzerprogramme
  # Pakete aus unstable: pkgs-unstable.paketname
  # Pakete aus stable:   pkgs.paketname
  # ─────────────────────────────────────────
  home.packages = [
    pkgs.keepassxc
  ];
  programs.firefox.enable = true;
}
