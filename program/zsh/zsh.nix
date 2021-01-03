
# Shell configuration for zsh 

{ config, lib, pkgs, ... }:

let
  # Set all shell aliases programatically
  shellAliases = {
    # Aliases for commonly used tools
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    cat = "bat";
    find = "fd";
    l = "exa";
    ll = "ls -lh";
    ls = "exa";
    k = "kubectl";
    dc = "docker-compose";
    md = "mdcat";

    # Nix garbage collection
    garbage-collection = "nix-collect-garbage -d && docker image prune --force";
  };
in {
  # zsh settings
  programs.zsh = {
    inherit shellAliases;
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history.extended = true;

    # Called whenever zsh is initialized
    initExtra = ''
      export TERM="xterm-256color"
      bindkey -v

      # Nix setup (environment variables, etc.)
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
      if [ -e ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      fi
      export PATH=$PATH:/run/current-system/sw/bin
      export PATH=$PATH:/usr/local/bin

      # Load environment variables from a file; this approach allows me to not
      # commit secrets like API keys to Git
      if [ -e ~/.env ]; then
        . ~/.env
      fi

      # Start up Starship shell
      eval "$(starship init zsh)"

      # Autocomplete for various utilities
      source <(kubectl completion zsh)
      source <(doctl completion zsh)
      source <(npm completion zsh)

      if [ -n "$(fzf-share)" ]; then
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      fi

      # direnv setup
      eval "$(direnv hook zsh)"

      if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
          tmux attach -t default || tmux new -s default
      fi

      export GPG_TTY=$(tty)
    '';
  };
}
