# ============================================================
# Git Config für user corum auf alle Hosts
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user.email = "nexusice1234@googlemail.com";
      user.name = "nexus-ice";
    };
  };
}
