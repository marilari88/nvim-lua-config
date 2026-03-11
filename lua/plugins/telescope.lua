return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local trouble = require("trouble.sources.telescope")

			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					mappings = {
						i = { ["<c-t>"] = trouble.open },
						n = { ["<c-t>"] = trouble.open },
					},
				},
				pickers = {
					buffers = {
						sort_mru = true,
					},
				},
			})
		end,
	},
	{

		"nvim-telescope/telescope-frecency.nvim",
		version = "*",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
}
