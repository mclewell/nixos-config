{ pkgs, config, lib, outputs, ... }:
let ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  #users.mutableUsers = false;
  users.extraGroups.matthew.gid = 1000;
  users.users.matthew = {
    isNormalUser = true;
    uid = 1000;
    group = "matthew";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1Cz2I55fN0YFsADPDbOfCSzXh8syPrZDd48WCWQV34 matthew@laptop"
    ];
    extraGroups = [
      "wheel"
      "dialout"   
    ] ++ ifExists [
      "libvirtd"
      "docker"
      "networkmanager"
    ];
  };
}
