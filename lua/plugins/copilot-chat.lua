return {
	{
		"jellydn/CopilotChat.nvim",
		opts = {
			debug = true,
			show_help = "yes",
			prompts = {
				Explain = "Explain how it works.",
				Review = "Review the following code and provide concise suggestions.",
				Tests = "Write tests using vitest and react testing library. We should conver all the edge cases.",
				Refactor = "Refactor the code to improve clarity and readability.",
			},
		},
		build = function()
			vim.defer_fn(function()
				vim.cmd("UpdateRemotePlugins")
				vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
			end, 3000)
		end,
		event = "VeryLazy",
		config = function()
			local present, wk = pcall(require, "which-key")
			if not present then
				return
			end

			wk.register({
				c = {
					name = "Copilot Chat",
				},
			}, {
				mode = "n",
				prefix = "<leader>",
				silent = true,
				noremap = true,
				nowait = false,
			})
		end,
		keys = {
			{ "<leader>cc", ":CopilotChatInPlace ", desc = "CopilotChat - Prompt" },
			{ "<leader>ce", ":CopilotChatExplain ", desc = "CopilotChat - Explain code" },
			{ "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{ "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
			{ "<leader>cR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
			{
				"<leader>ci",
				function()
					local input = vim.fn.input("Ask Copilot: ")
					if input ~= "" then
						vim.cmd("CopilotChat " .. input)
					end
				end,
				desc = "CopilotChat - Ask input",
			},
		},
	},
}
