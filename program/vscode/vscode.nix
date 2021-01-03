
# Visual Studio Code settings

{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # package = with pkgs; vscodium;

    userSettings = {
      "go.formatTool" = "gofmt";
      "go.lintTool" = "golint";
      "go.lintOnSave" = "file";
      "go.useLanguageServer" = true;
      "[go]" = {
        "editor.formatOnSave" = true;
        "editor.snippetSuggestions" = "none";
        "editor.codeActionsOnSave" = {
          "source.organizeImports" =  true;
        };
      };
      "go.toolsEnvVars" = {
        "GOFLAGS" = "-tags=sandbox,integration,e2e";
      };
      "go.languageServerFlags" = [];
      "window.zoomLevel" = 0;
      "editor.formatOnSave" =  true;
    };

    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      vscodevim.vim
      golang.Go
      redhat.vscode-yaml
      ms-vscode-remote.remote-ssh
    ];
  };
}
