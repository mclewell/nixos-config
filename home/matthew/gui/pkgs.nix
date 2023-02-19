{ pkgs, ... }: 
{
  home.packages = with pkgs; [
      vlc
      gimp
      inkscape
      libreoffice-fresh
      darktable
      cryptomator
      vscode
      spotify
    ];
}
