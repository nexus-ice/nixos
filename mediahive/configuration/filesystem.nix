# ============================================================
# Filesystem Configuration for MediaHive
# ============================================================
{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  fileSystems."/mnt/HDD1" = {
    device = "/dev/disk/by-uuid/19a0fa3c-178f-4acc-a089-aa9506d76d70";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD2" = {
    device = "/dev/disk/by-uuid/294f8910-98f5-4635-8e3e-1faf597f304e";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD3" = {
    device = "/dev/disk/by-uuid/c179843d-2ded-4239-becf-55a0d7a0b2de";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD4" = {
    device = "/dev/disk/by-uuid/74713556-d11e-4760-bd54-e72395a18ac1";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD5" = {
    device = "/dev/disk/by-uuid/841f9deb-bddd-42e6-bd1f-0070067d8802";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD6" = {
    device = "/dev/disk/by-uuid/0cf68225-3b91-4c7a-b250-e42bc999cd5d";
    fsType = "ext4";
  };
}
