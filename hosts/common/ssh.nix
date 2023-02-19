{ lib, config, ... }:
{
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    permitRootLogin = "no";
    matchBlocks = {
      "github.com" = {
        Hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
