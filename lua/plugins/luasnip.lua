return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		ls.config.set_config({
			history = false,
			update_events = "TextChanged,TextChangedI",
		})

		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
			loadfile(ft_path)()
		end

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if ls.expand_or_jumpable then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })
	end,
}
