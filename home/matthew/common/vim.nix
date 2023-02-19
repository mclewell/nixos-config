{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set laststatus=2
      set number
      set nowrap
      set tabstop=4
      set shiftwidth=4
      set smartindent
      "set expandtab
      set nocompatible
      set t_Co=256
      syntax enable
      "set background=dark
      colorscheme torte
      set cursorline
      set backspace=indent,eol,start
      " Return to last edit position when opening files (You want this!)
      autocmd BufReadPost *
           \ if line("'\"") > 0 && line("'\"") <= line("$") |
           \   exe "normal! g`\"" |
           \ endif
    '';
    plugins = [ pkgs.vimPlugins.lightline-vim ];
  };
}
