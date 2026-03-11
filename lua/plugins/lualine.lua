local config2 = {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "filename", path = 1 } },
		lualine_c = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "🤌", warn = "🐦", hint = "🤦‍♂️" },
			},
		},
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
			"filetype",
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
	tabline = {
		lualine_a = { "tabs" },
		lualine_b = { "buffers" },
		lualine_c = {},
	},
	extensions = {},
}

-- Now don't forget to initialize lualine
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup(config2)
	end,
}
