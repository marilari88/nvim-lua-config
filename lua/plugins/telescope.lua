local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>p", "<cmd>Telescope find_files<cr>")
map("n", "<leader>r", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>b", "<cmd>Telescope buffers<cr>")
map("n", "<leader>h", "<cmd>Telescope help_tags<cr>")

return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
			pickers = {
				buffers = {
					sort_mru = true,
				},
			},
		})
	end,
}
