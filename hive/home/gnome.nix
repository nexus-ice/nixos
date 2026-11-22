# ============================================================
# Gnome Settings für user corum auf Host Hive
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
  # Gnome Settings
  # ─────────────────────────────────────────
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

}
