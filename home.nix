{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./program/vim/vim.nix
    ./program/vscode/vscode.nix
    ./program/tmux/tmux.nix
    ./program/zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    ripgrep
    zsh
    fzf
    starship
    direnv
    dnsutils
    go  
    jq
    yq
    lua
    nodejs
    yarn
    rustup
    tmux
    vault

    kubectl
    fd
    exa
    docker
    docker-compose
    mdcat
    doctl
    buildpack
    terraform_0_13

    # Utils
    # age
    # nmap
    # ssh-audit
    # ytop
    # pueue
    # zoxide

    # Development
    # ctags
    # direnv
    # dnsutils
    # elixir
    # exercism
    # git-crypt
    # gitAndTools.gitflow
    # glow
    # gnumake
    # lorri
    # luarocks
    # nixpkgs-fmt
    # pre-commit
    # terraform_0_12
    # ## Python Dev
    # python37Packages.jupyterlab
    # python37Packages.pylint


    # Files and networking
    #brig
    #ipfs
    # croc
    # gcsfuse
    # gocryptfs
    # magic-wormhole
    # qrencode
    # ranger
    # restic
    # syncthing
    # whois
    # wrk
    # zstd

    # Media
    # youtube-dl
    # imagemagick

    # Overview
    # htop
    # wtf
    # lazygit
    # neofetch
  ];

  programs.ssh = {
    enable = true;
	extraConfig = ''
	  Host github.com
		User nicktate
		Hostname github.com
		PreferredAuthentications publickey
		IdentityFile /Users/nicholastate/.ssh/github-personal
    '';
  };

  programs.git = {
    enable = true;
    userName  = "Nicholas Tate";
    userEmail = "ntate22@gmail.com";
    signing.key = "EF92251AB53E94A3";
    signing.signByDefault = true;
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };

  programs.gpg.enable = true;
  home.file.".gnupg/gpg-agent.conf".text = ''
disable-scdaemon
  '' + (if pkgs.stdenv.isDarwin then ''
pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '' else
	"");
# pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
# pinentry-program ${pkgs.pinentry}/bin/pinentry

  nixpkgs.config.allowUnfree = true;

  # Environment
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "chrome";
    TERMINAL = "alacritty";
  };

  home.file.".config/alacritty/alacritty.yml".source = ./program/alacritty/settings.yml;
  home.file."Library/Preferences/com.knollsoft.Rectangle.plist".source = ./program/rectangle/settings.plist;
  home.file.".config/karabiner/karabiner.json".source = ./program/karabiner/karabiner.json;
  home.file.".hammerspoon/init.lua".source = ./program/hammerspoon/init.lua;
  home.file.".hammerspoon/hyper.lua".source = ./program/hammerspoon/hyper.lua;
}
