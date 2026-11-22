# ============================================================
# Software für user corum auf alle Hosts
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
    pkgs.just
  ];
}
