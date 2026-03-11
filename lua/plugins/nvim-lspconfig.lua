local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '<Leader>d', vim.diagnostic.setloclist, opts)
--
vim.keymap.set("n", "<Leader>d", "<cmd>Trouble diagnostics toggle<CR>", opts)
-- vim.keymap.set('n', '[g', trouble.next({skip_groups = true, jump = true}), opts)
-- vim.keymap.set('n', ']g', trouble.previous({skip_groups = true, jump = true}), opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
	--  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)
	-- vim.keymap.set("n", "gy", "<cmd>TroubleToggle lsp_type_definitions<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Trouble lsp toggle focus=false<CR>", opts)
	--[[ vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) ]]
	--[[ vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) ]]
	--[[ vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts) ]]
	--[[ vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts) ]]
	--[[ vim.keymap.set("n", "<Leader>aa", vim.lsp.buf.code_action, bufopts) ]]
	--[[ vim.keymap.set("v", "<Leader>aa", vim.lsp.buf.code_action, bufopts) ]]
	--[[ vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, bufopts) ]]
end

return {
	"neovim/nvim-lspconfig",
	--[[ dependencies = { "saghen/blink.cmp" }, ]]
	event = "BufReadPre",
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.config("ts_ls", {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				require("nvim-navbuddy").attach(client, bufnr)
				require("twoslash-queries").attach(client, bufnr)

				vim.keymap.set("n", "<leader>;", function()
					organize_imports()
				end, { buffer = bufnr, silent = true, noremap = true })

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
			settings = {
				complete_function_calls = true,
			},
		})

		vim.lsp.config("tailwindcss", {
			settings = {
				["tailwindCSS"] = {
					experimental = { classRegex = { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" } },
				},
			},
			filetypes = {
				"css",
				"scss",
				"sass",
				"html",
				"heex",
				"elixir",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
			},
		})

		vim.lsp.config("prismals", {})
		vim.lsp.config("astro", {})
		vim.lsp.config("intelephense", {})

		vim.lsp.config("lua_ls", {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				on_attach(client, bufnr)
			end,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						pathStrict = true,
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						library = {
							"${3rd}/luv/library",
							vim.env.VIMRUNTIME,
							vim.fn.stdpath("data") .. "/lazy/plenary.nvim",
						},
						maxPreload = 1600,
						preloadFileSize = 1000,
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
		vim.lsp.enable({ "ts_ls", "tailwindcss", "prismals", "astro", "intelephense" })
	end,
}
