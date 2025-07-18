{
  profile,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./zshrc-personal.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["direnv" "vi-mode"];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    initContent = ''
      if [ -f $HOME/.zshrc-personal ]; then
        source $HOME/.zshrc-personal
      fi
    '';

    shellAliases = {
      c = "clear";
      cat = "bat";
      dev = "f() {nix develop --accept-flake-config --no-pure-eval ~/.config/nixos/dev-shells#$1 --command zsh;};f";
      fr = "nh os switch --hostname ${profile}";
      fu = "nh os switch --hostname ${profile} --update";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";
      k = "kubectl";
      kg = "kubectl get";
      ka = "kubectl apply";
      la = "eza --icons -lah --group-directories-first -1";
      ll = "eza --icons -lh --group-directories-first -1 --no-user --long";
      ls = "eza --icons --group-directories-first -1";
      man = "batman";
      mp4-shrink = "f() {ffmpeg -i \"$1\" -vcodec libx265 -crf 28 \"$2\";};f";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      sv = "sudo nvim";
      tree = "eza --icons --tree --group-directories-first";
      v = "nvim";
    };
  };
}
