vim.g.VM_default_mappings = 0
--[[ vim.keymap.set(
	{ "n" },
	"<C-S-up>",
	":call vm#commands#add_cursor_up(0, v:count1)<cr>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	{ "n" },
	"<C-S-down>",
	":call vm#commands#add_cursor_down(0, v:count1)<cr>",
	{ noremap = true, silent = true }
) ]]
vim.g.VM_maps = {
	["Switch Mode"] = "<tab>",
	["Find Under"] = "<A-l>",
	["Find Subword Under"] = "<C-f>",
	["Skip Region"] = "<A-;>",
	["Remove Region"] = "<A-h>",
	["Add Cursor Up"] = "<C-S-up>",
	["Add Cursor Down"] = "<C-S-down>",
}

return {
	"mg979/vim-visual-multi",
}
