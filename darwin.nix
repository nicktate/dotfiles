{ config, lib, pkgs, attrsets, ... }:
{
  imports = [
    <home-manager/nix-darwin>
    ./work/darwin.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pinentry
    pinentry_mac
    alacritty
    vscode
  ];

  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "left";
  system.defaults.dock.showhidden = true;
  system.defaults.dock.mru-spaces = false;

  services.nix-daemon.enable = false;
  nix.useDaemon = false;
  system.stateVersion = 4;
}
