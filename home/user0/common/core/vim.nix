{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    extraConfig = ''
      syntax on
      filetype on
      filetype plugin on
      filetype indent on
      set backspace=2
      set number

      set tabstop=4
      set softtabstop=4
      set expandtab
      set shiftwidth=4
      set autoindent
      set copyindent
      set smartindent

      set hlsearch
      set incsearch
      set showmatch
      set ignorecase
      set smartcase
    '';
  };
}
