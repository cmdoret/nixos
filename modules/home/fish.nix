{host, profile, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -g fish_key_bindings fish_vi_key_bindings
    '';
    generateCompletions = true;

    shellAliases = {
        c = "clear";
        cat = "bat";
        fr = "nh os switch --hostname ${host}";
        fu = "nh os switch --hostname ${host} --update";
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
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        sv = "sudo nvim";
        tree = "eza --icons --tree --group-directories-first";
        v = "nvim";
    };

    functions = {
      dev = {
        description = "Enter a nix dev shell";
        body = ''
          nix develop --accept-flake-config --no-pure-eval ~/.config/nixos/dev-shells#$argv[1] --command fish
        '';
      };
      mp4-shrink = {
        description = "Shrink mp4 using h265";
        body = ''
          ffmpeg -i $argv[1] -vcodec libx265 -crf 28 $argv[2]
        '';
      };
    };
  };
}
