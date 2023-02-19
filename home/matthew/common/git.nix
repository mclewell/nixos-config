{ pkgs, ... }:
{
  programs.git = { 
    enable = true;
    userName = "Matthew Clewell";
    userEmail = "matt@mattclewell.com";
    extraConfig = { 
      init = { 
        defaultBranch = "main";                                                                            
      };  
    };  
  };
}
