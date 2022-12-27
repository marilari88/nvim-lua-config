vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>InspectTwoslashQueries<CR>", {})

-- map esc
map("i", "jj", "<Esc>")
map("c", "jj", "<C-C>")

-- move lines
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", ":m .-2<CR>==")
map("n", "<A-j>", ":m .+1<CR>==")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")
map("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- move between panes
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- save
map("n", "<Leader>w", ":w<CR>")

-- quit
map("n", "<Leader>q", ":q<CR>")

-- jump to last buffer
map("n", "<Leader><space>", "<C-^>")

map("n", "<C-p>", "<cmd>bprev<CR>")
map("n", "<C-n>", "<cmd>bnext<CR>")

-- open terminal
map("n", "<Leader>t", ":vsplit +term<CR> i")

-- terminal mappings
map("t", "jj", "<C-\\><C-n>")

-- Windows resizing
map("n", "<C-left>", "<C-w>5<")
map("n", "<C-right>", "<C-w>5>")
map("n", "<C-down>", "<C-w>5+")
map("n", "<C-up>", "<C-w>5-")

map("t", "<C-left>", "<C-w>5<")
map("t", "<C-right>", "<C-w>5>")
map("t", "<C-down>", "<C-w>5+")
map("t", "<C-up>", "<C-w>5-")

map("n", "Y", "y$")

map("n", "<Leader>n", "<cmd>NvimTreeToggle<CR>")

map("n", "<Leader>g", "<cmd>Git<CR>")

map("n", "<Leader>jn", "<cmd>NeotestSummary<CR>")
map("n", "<Leader>jt", "<cmd>NeotestNearest<CR>")
map("n", "<Leader>jf", "<cmd>NeotestFile<CR>")
map("n", "<Leader>jp", "<cmd>Neotest<CR>")
map("n", "<Leader>ja", "<cmd>NeotestAttach<CR>")

map("n", "<leader>m", "<cmd>MarksListAll<cr>")

return map
