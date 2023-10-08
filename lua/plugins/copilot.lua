return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = true },
			panel = { enabled = false, auto_refresh = true, jump_next = "]]", refresh = "gr" },
		})
	end,
}
