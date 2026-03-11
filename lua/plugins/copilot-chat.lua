local prompts = {
	Explain = {
		prompt = "> /COPILOT_EXPLAIN\n\nWrite an explanation for the selected code as paragraphs of text.",
	},
	Review = {
		prompt = "> /COPILOT_REVIEW\n\nReview the selected code.",
	},
	fix = {
		prompt = "Identify and briefly explain the issues in the code. Then provide the minimal fix. Output only: 1) Issues (bulleted), 2) Corrected code (single code block with proper language tag), 3) Rationale (short). Preserve public API and behavior; avoid unnecessary changes and follow the existing style.",
	},
	Optimize = {
		prompt = "Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.",
	},
	Docs = {
		prompt = "Please add documentation comments to the selected code.",
	},
	Tests = {
		prompt = "Please generate tests for my code.",
	},
	Commit = {
		prompt = "> #git:staged\n\nWrite commit message for the change with gitmoji. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. #url:https://gitmoji.dev/",
	},
	["Test Staged"] = {
		prompt = "> #git:staged\n\nWrite test for the staged changes using vitest.",
	},
	["Review Staged"] = {
		prompt = "> /COPILOT_REVIEW #git:staged\n\nReview the staged changes",
	},
	["Summarize Staged"] = {
		prompt = "> #git:staged\n\nSummarize the staged changes as bullet points, highlighting user-visible impact, performance implications, and breaking changes.",
	},
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "make tiktoken",
	event = "VeryLazy",
	config = function()
		require("CopilotChat").setup({
			model = "gpt-5",
			prompts = prompts,
			selection = function(source)
				return require("CopilotChat.select").visual(source) or require("CopilotChat.select").line(source)
			end,
			window = {
				layout = "float",
				width = 80, -- Fixed width in columns
				height = 20, -- Fixed height in rows
				border = "rounded", -- 'single', 'double', 'rounded', 'solid'
				title = "🤖 AI Assistant",
				zindex = 100, -- Ensure window stays on top
			},

			headers = {
				user = "👤 You: ",
				assistant = "🤖 Copilot: ",
				tool = "🔧 Tool: ",
			},
			separator = "━━",
			show_folds = false,
		})

		vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
			require("CopilotChat").ask(args.args, { selection = require("CopilotChat.select").visual })
		end, { nargs = "*", range = true })

		vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
			require("CopilotChat").ask(args.args, { selection = require("CopilotChat.select").buffer })
		end, { nargs = "*", range = true })

		vim.api.nvim_create_user_command("CopilotChatInline", function(args)
			require("CopilotChat").ask(args.args, {
				selection = require("CopilotChat.select").visual,
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
			})
		end, { nargs = "*", range = true })
	end,
	keys = {
		{
			"<leader>av",
			":CopilotChatVisual ",
			mode = "x",
			desc = "Copilot Chat Visual",
		},
		{
			"<leader>ax",
			":CopilotChatInline ",
			mode = "x",
			desc = "Copilot Chat Inline",
		},
		{
			"<leader>aq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, {
						selection = require("CopilotChat.select").buffer,
					})
				end
			end,
			desc = "CopilotChat - Quick chat",
			mode = "n",
		},
		{
			"<leader>at",
			"<cmd>CopilotChatToggle<cr>",
			desc = "Copilot Chat Toggle",
			mode = { "n", "x" },
		},
		{
			"<leader>ap",
			"<cmd>CopilotChatPrompts<cr>",
			desc = "Copilot Chat Toggle",
			mode = { "n", "x" },
		},
	},
}
