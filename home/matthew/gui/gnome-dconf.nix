{pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/privacy" = {
        disable-camera = true;
        disable-microphone = true;
        remember-recent-files = false;
      };
      "org/gnome/desktop/session".idle-delay = 900; #TODO: this needs to be an unsigned int, hm is putting in a signed int
      "org/gnome/desktop/notifications".show-banners = false;
      "org/gnome/desktop/interface".clock-format = "12h";
      "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
      "org/gnome/shell" = {
        enabled-extensions = ["launch-new-instance@gnome-shell-extensions.gcampax.github.com" "appindicatorsupport@rgcjonas.gmail.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com"];
        favorite-apps = ["firefox.desktop" "org.gnome.Geary.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Terminal.desktop" "spotify.desktop" "steam.desktop"];
      };
      "org/gnome/desktop/interface".enable-hot-corners = false;
      "org/gtk/settings/file-chooser".sort-directories-first = true;
      "org/gnome/desktop/wm/preferences".button-layout = "appmenu:minimize,maximize,close";
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = ["<Super>Tab"];
        switch-applications-backwards = ["<Shift><Super>Tab"];
        switch-windows = ["<Alt>Tab"];
        switch-windows-backwards = ["<Shift><Alt>Tab"];
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        tap-to-click = true;
      };

      # Custom Keybindings
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Primary><Alt>t";
        command = "gnome-terminal";
        name = "Launch Terminal";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Primary><Shift>Escape";
        command = "gnome-system-monitor";
        name = "Launch System Monitor";
      };
      "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];

      # Set Dark-Mode and Flat Wallpaper
      "org/gnome/desktop/background".picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.webp";
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      
      # Gnome Terminal Settings
      "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        audible-bell = false;
        default-size-columns = 90;
        default-size-rows = 30;
        font = "Monospace 14";
        use-system-font = false;
        visible-name = "default";
        background-color = "rgb(23,20,33)";
        foreground-color = "rgb(208,207,204)";
        use-theme-colors = false;
      };
      "org/gnome/terminal/legacy".theme-variant = "dark";

      # Text Editor Settings
      "org/gnome/TextEditor" = {
        custom-font = "Monospace 14";
        highlight-current-line = true;
        show-line-numbers = true;
        show-map = true;
        use-system-font = false;
      };
    };
  };
}
