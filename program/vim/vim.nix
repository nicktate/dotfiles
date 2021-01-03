
# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-colors-solarized
      YouCompleteMe
    ];

	settings = {
	  background = "dark";
	  expandtab = true;
	  history = 1000;
	  ignorecase = true;
	  number = true;
	  shiftwidth = 4;
	  tabstop = 4;
	};


    # Replaces ~/.tmux.conf
    extraConfig = ''
      set linebreak   
      set showbreak=+++   
      set textwidth=120
      set showmatch
      set visualbell  
       
      set hlsearch
      set smartcase
      set ignorecase
      set incsearch
       
      set softtabstop=4
       
      set ruler   
       
      set undolevels=1000
      set backspace=indent,eol,start  
    '';
  };
}
