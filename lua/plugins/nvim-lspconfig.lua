local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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

require("lspconfig")["tsserver"].setup({
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>;", ":OrganizeImports<CR>", opts)

		require("twoslash-queries").attach(client, bufnr)

		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").sumneko_lua.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre  <buffer> lua vim.lsp.buf.format({timeout_ms = 5000})")
		end
		on_attach(client, bufnr)
	end,
})
