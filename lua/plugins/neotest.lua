return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-plenary",
	},
	config = function(opts)
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					vitestCommand = "yarn vitest",
				}),
			},
			icons = {
				running_animated = {
					"",
					"🞅",
					"🞈",
					"🞉",
					"",
					"",
					"🞉",
					"🞈",
					"🞅",
					"",
				},
			},
			quickfix = { open = false },
			output = {
				enabled = true,
				open = "botright split | resize 15",
			},
			watch = {
				enabled = true,
				symbol_queries = {
					typescript = [[
        ;query
        ;Captures named imports
        (import_specifier name: (identifier) @symbol)
        ;Captures default import
        (import_clause (identifier) @symbol)
        ;Capture require statements
        (variable_declarator 
        name: (identifier) @symbol
        value: (call_expression (identifier) @function  (#eq? @function "require")))
          ;Capture namespace imports
          (namespace_import (identifier) @symbol)


          ]],
					javascript = [[
          ;query
          ;Captures imported types
          (import_specifier name: (identifier) @symbol)
          ;Captures imported types
          (import_clause (identifier) @symbol)
          ]],
					tsx = [[
          ;query
          ;Captures imported types
          (import_specifier name: (identifier) @symbol)
          ;Captures imported types
          (import_clause (identifier) @symbol)
          ]],
				},
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
			desc = "Neotest toggle summary",
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
		{
			"<leader>tww",
			function()
				require("neotest").watch.watch({ vitestCommand = "yarn vitest --watch" })
			end,
			desc = "Run Watch file",
		},
		{
			"<leader>twr",
			function()
				require("neotest").run.run({ vitestCommand = "yarn vitest --watch" })
			end,
			desc = "Run Watch",
		},
		{
			"<leader>twf",
			function()
				require("neotest").run.run({ vim.fn.expand("%"), vitestCommand = "vitest --watch" })
			end,
			desc = "Run Watch File",
		},
	},
}
