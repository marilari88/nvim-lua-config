return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-plenary",
	},
	config = function(opts)
		require("neotest").setup({
			adapters = {
				require("neotest-vitest"),
				require("neotest-jest"),
				require("neotest-plenary"),
			},
			quickfix = { open = true },
			output = {
				enabled = true,
				open = "botright split | resize 15",
			},
		})
	end,
	keys = {
		{
			"<leader>ts",
			function()
				--[[ require("neotest").summary.toggle() ]]
				vim.cmd([[Neotest summary]])
			end,
			desc = "Neotest toggle",
		},
		{
			"<leader>tp",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Neotest output_panel toggle",
		},
		{
			"<leader>tt",
			function()
				vim.cmd([[Neotest run]])
			end,
			desc = "Neotest nearest",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Neotest file",
		},
		{
			"<leader>ta",
			function()
				vim.cmd([[Neotest attach]])
			end,
			desc = "Neotest attach",
		},
	},
}
