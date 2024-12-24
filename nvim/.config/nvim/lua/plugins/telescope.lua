return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            hidden = true
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
