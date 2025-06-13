{
  inputs,
  config,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      lsp.enable = true;
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      lineNumberMode = "relNumber";
      enableLuaLoader = true;
      preventJunkFiles = true;
      options = {
        tabstop = 4;
        shiftwidth = 2;
        wrap = false;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
        };
      };

      assistant = {
        copilot = {
          enable = true;
          cmp.enable = true;
        };
        codecompanion-nvim.enable = true;
      };
      maps = {
        normal = {
          "<C-n>" = {
            action = "<CMD>Neotree toggle<CR>";
            silent = false;
          };
        };
        terminal = {
          "<C-x>" = {
            action = "<C-\\><C-n>";
            silent = false;
            desc = "Exit terminal mode";
          };
        };
      };

      diagnostics = {
        enable = true;
        config = {
          signs = {
            text = {
              "vim.diagnostic.severity.ERROR" = "󰅚 ";
              "vim.diagnostic.severity.WARN" = "󰀪 ";
            };
          };
          float = {
            border = ["╔" "═" "╗" "║" "╝" "═" "╚" "║"];
          };
          underline = true;
        };
      };

      keymaps = [
        {
          key = "<tab>";
          mode = ["n"];
          action = ":bnext<CR>";
          desc = "next buffer";
        }
        {
          key = "<S-tab>";
          mode = ["n"];
          action = ":bprevious<CR>";
          desc = "previous buffer";
        }
        {
          key = "<leader>w";
          mode = ["n"];
          action = ":bdelete<CR>";
          desc = "close buffer";
        }
        {
          key = "jk";
          mode = ["i"];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>fw";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<M-v>";
          mode = ["n"];
          action = "<cmd>ToggleTerm direction=vertical<cr>";
          desc = "toggle vertical terminal.";
        }
        {
          key = "<M-h>";
          mode = ["n"];
          action = "<cmd>ToggleTerm direction=horizontal<cr>";
          desc = "toggle horizontal terminal.";
        }
        {
          key = "<M-i>";
          mode = ["n"];
          action = "<cmd>ToggleTerm direction=float<cr>";
          desc = "toggle floating terminal.";
        }
        {
          key = "<C-h>";
          mode = ["n"];
          action = "<C-W><Left>";
          desc = "window left";
        }
        {
          key = "<C-j>";
          mode = ["n"];
          action = "<C-w><Down>";
          desc = "window down";
        }
        {
          key = "<C-k>";
          mode = ["n"];
          action = "<C-w><Up>";
          desc = "window up";
        }
        {
          key = "<C-l>";
          mode = ["n"];
          action = "<C-w><Right>";
          desc = "window right";
        }
        {
          key = "<C-h>";
          mode = ["i"];
          action = "<Left>";
          desc = "Move left in insert mode";
        }
        {
          key = "<C-j>";
          mode = ["i"];
          action = "<Down>";
          desc = "Move down in insert mode";
        }
        {
          key = "<C-k>";
          mode = ["i"];
          action = "<Up>";
          desc = "Move up in insert mode";
        }
        {
          key = "<C-l>";
          mode = ["i"];
          action = "<Right>";
          desc = "Move right in insert mode";
        }
        {
          key = "gd";
          mode = "n";
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          desc = "Go to definition";
        }
        {
          key = "gD";
          mode = "n";
          action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
          desc = "Go to declaration";
        }
        {
          key = "gr";
          mode = "n";
          action = "<cmd>lua vim.lsp.buf.references()<CR>";
          desc = "Go to references";
        }
        {
          key = "<leader>dj";
          mode = ["n"];
          action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
          desc = "Go to next diagnostic";
        }
        {
          key = "<leader>dk";
          mode = ["n"];
          action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
          desc = "Go to previous diagnostic";
        }
        {
          key = "<leader>dl";
          mode = ["n"];
          action = "<cmd>Lspsaga show_line_diagnostics<CR>";
          desc = "Show diagnostic details";
        }
        {
          key = "<leader>dt";
          mode = ["n"];
          action = "<cmd>Trouble diagnostics toggle<cr>";
          desc = "Toggle diagnostics list";
        }
      ];

      telescope.enable = true;

      spellcheck = {
        enable = true;
        languages = ["en"];
        programmingWordlist.enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = false;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        nvim-docs-view.enable = false;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        clang.enable = true;
        zig.enable = true;
        python.enable = true;
        markdown.enable = true;
        ts = {
          enable = true;
          lsp.enable = true;
          format.type = "prettierd";
          extensions.ts-error-translator.enable = true;
        };
        html.enable = true;
        lua.enable = true;
        css.enable = false;
        typst.enable = true;
        rust = {
          enable = true;
          crates.enable = true;
        };
      };
      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        rainbow-delimiters.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      tabline.nvimBufferline.enable = true;
      treesitter.context.enable = false;
      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };
      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = false;
      filetree.neo-tree.enable = true;
      notify = {
        nvim-notify.enable = true;
        nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };
      utility = {
        preview.markdownPreview.enable = true;
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = false;
        };
        images = {
          image-nvim.enable = false;
        };
      };
      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };
      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = true;
        };
        fastaction.enable = true;
      };

      session = {
        nvim-session-manager.enable = false;
      };
      comments = {
        comment-nvim.enable = true;
      };
    };
  };

  # Source custom Lua explicitly
  home.file.".config/nvim/init.lua" = {
    text = ''
      vim.notify("Main init.lua loaded", vim.log.levels.INFO)
      pcall(require, "custom.init")
    '';
  };

  home.file.".config/nvim/lua/custom/init.lua" = {
    text = ''
      -- Debug notification
      vim.notify("Custom Lua loaded", vim.log.levels.INFO)
      -- Diagnostics configuration (fallback)
      vim.diagnostic.config({
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true
      })
    '';
  };
}
