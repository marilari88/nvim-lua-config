local map = require("keybindings")

return {
	"JellyApple102/flote.nvim",
	config = function()
		require("flote").setup({
			window_title = false,
		})
		map("n", "<leader>l", "<cmd>Flote<cr>")
	end,
}
