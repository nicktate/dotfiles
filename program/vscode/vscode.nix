
# Visual Studio Code settings

{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # package = with pkgs; vscodium;

    userSettings = {
    };

    extensions = with pkgs.vscode-extensions; [
    ];
  };
}
