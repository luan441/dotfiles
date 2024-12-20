return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "dokwork/lualine-ex" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local treesistter = {
			function()
				return "TS  "
			end,
			color = function()
				local buf = vim.api.nvim_get_current_buf()
				local ts = vim.treesitter.highlighter.active[buf]
				return { fg = ts and not vim.tbl_isempty(ts) and "#98971a" or "#cc241d" }
			end,
		}

		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					treesistter,
					"ex.lsp.all",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
