{pkgs, ...}:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = "[](white)$os[](bg:blue fg:white)$directory[](blue)$git_branch$git_status$cmd_duration $fill [](green)$nodejs$c$rust$golang$php$java$haskell$python$docker_context$conda$nix_shell$shell[](green)$line_break$character";
      continuation_prompt = "[▸▹ ](white)";
      fill.symbol = " ";

      username = {
        style_user = "yellow bold";
        style_root = "black bold";
        format = "[//](black bold) [$user](#2883ff) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        disabled = false;
      };

      directory = {
        style = "bg:blue fg:bright-white";
        format = "[ $path ]($style)";
        truncation_length = 1;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
          "~" = " ~";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:yellow";
        format = "( [](yellow)[[ $symbol $branch ](fg:black bg:yellow)]($style))";
      };

      git_status = {
        style = "bg:yellow";
        format = "[[($all_status$ahead_behind)](fg:black bg:yellow)]($style)[](fg:yellow)";
      };

      character = {
        disabled = false;
        format = "$symbol";
        success_symbol = "[󱞩 ](bold green)";
        error_symbol = "[ ](bold red)";
        vimcmd_symbol = "[ ](white)";
        vimcmd_replace_one_symbol = "[󰇾 ](magenta)";
        vimcmd_replace_symbol = "[ ](magenta)";
        vimcmd_visual_symbol = "[󱎸 ](orange)";
      };

      cmd_duration = {
        show_milliseconds = false;
        format = "  took $duration ";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 45000;
      };

      os ={
        disabled = false;
        style = "bg:white fg:black";
        symbols = {
          AOSC = "";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Fedora = "󰣛";
          Gentoo = "󰣨";
          Linux = "󰌽";
          Macos = "󰀵";
          Manjaro = "";
          Mint = "󰣭";
          NixOS = " ";
          Raspbian = "󰐿";
          RedHatEnterprise = "󱄛";
          Redhat = "󱄛";
          SUSE = "";
          Ubuntu = "󰕈";
          Windows = "";
        };
      };

      shell = {
        disabled = false;
        style = "bold bg:green fg:black";
        format = "[$indicator ]($style)";
        bash_indicator = "";
        fish_indicator = "";
        zsh_indicator = "";
        nu_indicator = "󰟆";
      };

      c = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      conda = {
        symbol = "  ";
        style = "fg:black bg:blue";
        format = "[$symbol$environment ]($style)";
        ignore_base = false;
      };

      docker_context = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $context) ](fg:black bg:blue)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      nix_shell = {
        format = "[$symbol$state ]($style)";
        disabled = false;
        impure_msg = "[impure](fg:black bg:green)";
        pure_msg = "[pure](fg:black bg:green)";
        style = "fg:black bg:green";
        symbol = "󱩰 ";
      };

      nodejs = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version)(\(#$virtualenv\)) ](fg:black bg:green)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:green";
        format = "[[ $symbol( $version) ](fg:black bg:green)]($style)";
      };
    };
  };
}
