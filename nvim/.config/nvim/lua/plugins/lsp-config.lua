return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"phpactor",
					"dockerls",
					"docker_compose_language_service",
					"marksman",
          "yamlls",
          "jsonls",
          "gopls",
          "clangd",
          "ts_ls",
          "eslint"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = {
			servers = {
				lua_ls = {},
				phpactor = {},
				docker_compose_language_service = {},
				dockerls = {},
				marksman = {},
        jsonls = {},
        yamlls = {},
        gopls = {},
        clangd = {},
        ts_ls = {},
        eslint = {}
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require('cmp_nvim_lsp').default_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
