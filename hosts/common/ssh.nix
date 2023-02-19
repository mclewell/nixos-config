{ lib, config, ... }:
{
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    permitRootLogin = "no";
  };
}
