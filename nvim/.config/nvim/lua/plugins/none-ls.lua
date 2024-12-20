return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup()
		end,
	},
	{
		"zeioth/none-ls-autoload.nvim",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"zeioth/none-ls-external-sources.nvim", -- To install a external sources library.
		},
		opts = {
			external_sources = {
				-- To specify where to find a external source.
				"none-ls-external-sources.formatting.reformat_gherkin",
			},
		},
	},
}
