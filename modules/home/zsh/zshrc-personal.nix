{pkgs, ...}: {
  home.packages = with pkgs; [zsh];

  home.file."./.zshrc-personal".text = ''

      #!/usr/bin/env zsh

      # Push 'v' in command mode to enter a vim buffer and edit command
      bindkey -M vicmd v edit-command-line

  '';
}
