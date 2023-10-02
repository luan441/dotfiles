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
      format_on_save = true, -- enable or disable automatic formatting on save
      disabled = { "intelephense" }
    },
    servers = {
      "dartls",
    },
    setup_handlers = {
      -- add custom handler
      dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
    },
    config = {
      dartls = {
        -- any changes you want to make to the LSP setup, for example
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    },
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
    {
      'akinsho/flutter-tools.nvim',
    },
  }
}
