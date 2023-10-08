local map = require("keybindings")

return {
	"rest-nvim/rest.nvim",
	depedencies = "nvim-lua/plenary.nvim",
	config = function()
		require("rest-nvim").setup({
			result_split_horizontal = false,
			skip_ssl_verification = false,
			highlight = {
				enabled = true,
				timeout = 150,
			},
			jump_to_request = false,
		})
		map("n", ",x", "<Plug>RestNvim", { desc = "execute request" })
		map("n", ",p", "<Plug>RestNvimPreview", { desc = "preview curl" })
		map("n", ",l", "<Plug>RestNvimLast", { desc = "repeat last request" })
	end,
}
