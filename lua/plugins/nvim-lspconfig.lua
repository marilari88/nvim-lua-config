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
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<Leader>d', vim.diagnostic.setloclist, opts)
--
vim.keymap.set("n", "<Leader>d", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
-- vim.keymap.set('n', '[g', trouble.next({skip_groups = true, jump = true}), opts)
-- vim.keymap.set('n', ']g', trouble.previous({skip_groups = true, jump = true}), opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
	--  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)
	-- vim.keymap.set("n", "gy", "<cmd>TroubleToggle lsp_type_definitions<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("v", "<Leader>a", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, bufopts)
end

return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	config = function()
		-- Add additional capabilities supported by nvim-cmp
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		require("lspconfig").tsserver.setup({
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				require("nvim-navbuddy").attach(client, bufnr)

				vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>;", ":OrganizeImports<CR>", opts)

				require("twoslash-queries").attach(client, bufnr)

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		})

		require("lspconfig").tailwindcss.setup({
			settings = {
				["tailwindCSS"] = {
					experimental = { classRegex = { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" } },
				},
			},
		})

		require("lspconfig").cssls.setup({})
		require("lspconfig").prismals.setup({})
		require("lspconfig").astro.setup({})
		require("lspconfig").intelephense.setup({})

		require("lspconfig").lua_ls.setup({
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
							vim.fn.stdpath("data") .. "/lazy/telescope.nvim",
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
	end,
}
