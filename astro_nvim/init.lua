return {
  colorscheme = "dracula",
  options = {
    opt = {
      showtabline = 0,
      relativenumber = false,
      shiftwidth = 4,
      tabstop = 4,
    }
  },
  lsp = {
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
    },
    setup_handlers = {
      tsserver = function(_, opts) require("typescript").setup { server = opts } end
    }
  },
  plugins = {
    {
      "Mofiqul/dracula.nvim",
      name = "dracula"
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astronvim.utils.status")

        opts.statusline = {
          -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
          status.component.git_branch(),
          status.component.file_info(),
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          status.component.mode { surround = { separator = "right" } },
        }

        opts.winbar = nil
        return opts
      end
    },
    "jose-elias-alvarez/typescript.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "tsserver" }, -- automatically install lsp
      },
    },
    "terrastruct/d2-vim",
  },
  dap = {
    configurations = {
      php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 8123,
          pathMappings = {
            ["/app"] = "${workspaceFolder}"
          }
        }
      }
    }
  }
}
