return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    version = '0.*',
    dependencies = {
      { 'dmitmel/cmp-digraphs' },
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'rafamadriz/friendly-snippets' }
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'digraphs', 'luasnip' },
      },
    },
    opts_extend = { "sources.default" },
    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'digraphs', 'luasnip' },
      },
      providers = {
        digraphs = {
          name = 'digraphs', -- IMPORTANT: use the same name as you would for nvim-cmp
          module = 'blink.compat.source',
          score_offset = -3,
          opts = {
            cache_digraphs_on_start = true,
          },
        },
      },
    },
  },
}