{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "vim";
    };
    shellAliases = {
      ls = "ls -lah --color=auto";
      top = "htop";
      rebuild-os = "sudo nixos-rebuild switch --flake .#$HOSTNAME";
      rebuild-home = "home-manager switch --flake .#$USER@$HOSTNAME";
    };
    initExtra = ''
      PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    '';
  };
}
