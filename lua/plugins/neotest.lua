return {
	"nvim-neotest/neotest",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-plenary",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest"),
				require("neotest-vitest"),
				require("neotest-plenary"),
			},
			quickfix = { open = false },
		})

		vim.cmd([[
    command! NeotestSummary lua require("neotest").summary.toggle()
    command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
    command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
    command! NeotestNearest lua require("neotest").run.run()
    command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
    command! NeotestAttach lua require("neotest").run.attach()
    ]])
	end,
}
