{ config, pkgs, lib, ... }:
{

  networking.networkmanager.enable = true;

  services.xserver = {
    layout = "us";
    enable = true; 
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnome.gnome-themes-extra
  ];

  # Remove unnecessary packages that come with the default Gnome enviornment
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    epiphany
    gnome-weather
    yelp
    gnome-calendar
    gnome-contacts
    gnome-maps
    gnome-clocks
    totem
    seahorse
    gnome-disk-utility
    gnome-logs
    gnome-characters
    file-roller
  ]);
}
