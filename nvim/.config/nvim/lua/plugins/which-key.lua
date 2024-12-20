return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons ={
      mappings= false,
    },
    spec = {
      { '<leader>f', group = '[f]ind' },
      { '<leader>c', group = '[c]ode' },
      { '<leader>g', group = '[g]it' },
      { '<leader>d', group = '[d]ebugging' },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
