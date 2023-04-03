local map = require("keybindings")

return {
	"JellyApple102/flote.nvim",
	config = function()
		require("flote").setup()
		map("n", "<leader>l", "<cmd>Flote<cr>")
	end,
}
