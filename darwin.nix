{ config, lib, pkgs, attrsets, ... }:
{
  imports = [
    <home-manager/nix-darwin>
  ];

  users.users.nicholastate = {
    home = "/Users/nicholastate";
    description = "Nicholas Tate";
    shell = pkgs.zsh;
  };

  home-manager.users.nicholastate = (import ./home.nix);
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pinentry-curses
    pinentry_mac
    alacritty
    vscode
  ];

  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "left";
  system.defaults.dock.showhidden = true;
  system.defaults.dock.mru-spaces = false;

  environment.darwinConfig = "/Users/nicholastate/.config/nixpkgs/darwin.nix";
  services.nix-daemon.enable = false;
  nix.useDaemon = false;
  system.stateVersion = 4;
}
