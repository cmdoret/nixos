{ lib, pkgs, ... }:
{
  programs.obsidian = {
    enable = true;

    defaultSettings = {
      corePlugins = [
        "backlink"
        "bookmarks"
        "command-palette"
        "daily-notes"
        "editor-status"
        "file-explorer"
        "graph"
        "note-composer"
        "outline"
        "page-preview"
        "templates"
        "word-count"
      ];

    };
  };
}
