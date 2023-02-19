{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
      "10.10.10.2" = {
        user = "matthew";
        identityFile = "~/.ssh/id_rsa";
        extraOptions = {
          KexAlgorithms = "+diffie-hellman-group1-sha1";
          HostKeyAlgorithms = "+ssh-rsa";
          PubkeyAcceptedKeyTypes = "+ssh-rsa";
        };
      };
      "192.168.10.1" = {
        user = "matthew";
        identityFile = "~/.ssh/id_rsa";
        extraOptions = {
          PubkeyAcceptedKeyTypes = "+ssh-rsa";
        };
      };
      "192.168.10.0" = {
        user = "matthew";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
