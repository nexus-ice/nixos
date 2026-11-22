# ==============================================================
# Importiert alle Home Config files für user corum auf Host Hive
# ==============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  imports = [
    ./software.nix
    ./vscode.nix
    ./gnome.nix
  ];
}
