local map = require("keybindings")

return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"SmiteshP/nvim-navic",
	},
	config = function()
		map("n", "<leader>s", "<cmd>Navbuddy<cr>")
	end,
}
