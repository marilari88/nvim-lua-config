--- @class Task
--- @field name string
--- @field command string
--- @field label string
--- @field output_parser function

--- @type Task[]
local tasks = {
	{
		name = "EslintMake",
		command = "npx eslint . -f json",
		label = "Eslint",
		output_parser = function(output)
			-- Parse JSON output
			local decoded, err = vim.fn.json_decode(output)

			if not decoded then
				print("Could not parse ESLint JSON output: " .. err)
				return
			end

			-- Build the quickfix list
			local qf_list = {}

			for _, file_info in ipairs(decoded) do
				local filename = file_info.filePath
				for _, message in ipairs(file_info.messages) do
					-- Skip if line or column is missing (ESLint might report them as 0)
					local lnum = message.line or 1
					local col = message.column or 1
					local severity = message.severity or 1

					local ruleIdText = message.ruleId and (" [" .. tostring(message.ruleId) .. "]") or ""

					table.insert(qf_list, {
						filename = filename,
						lnum = lnum,
						col = col,
						text = tostring(message.message) .. ruleIdText,
						type = (severity == 2) and "E" or "W",
					})
				end
			end

			return qf_list
		end,
	},
	{
		name = "TscMake",
		command = "npx tsc --noEmit --pretty false",
		label = "TSC",
		output_parser = function(output)
			-- Build the quickfix list
			local qf_list = {}
			for line in output:gmatch("[^\r\n]+") do
				local filename, lnum, col, message = line:match("([^%(]+)%((%d+),(%d+)%)%: (.+)")
				if filename and lnum and col and message then
					table.insert(qf_list, {
						filename = filename,
						lnum = tonumber(lnum),
						col = tonumber(col),
						text = message,
						type = "E",
					})
				end
			end

			return qf_list
		end,
	},
}

--- @param task Task
local function create_task_command(task)
	vim.o.makeprg = task.command

	-- Show loading message in the status line
	local notifyRecord = vim.notify("Running " .. task.label .. "...", vim.log.levels.INFO, {
		title = "Please wait",
		timeout = false,
	})

	-- Variable to accumulate output
	local output_data = {}

	-- Run task asynchronously
	vim.fn.jobstart(vim.o.makeprg, {
		on_stdout = function(_, data, _)
			if data then
				for _, line in ipairs(data) do
					table.insert(output_data, line)
				end
			end
		end,
		on_stderr = function(_, data, _)
			if data then
				print("Error running " .. task.label .. ": " .. table.concat(data, "\n"))
			end
		end,
		on_exit = function(_, code, _)
			if code ~= 0 then
				vim.notify(task.label .. " exited with code " .. code, vim.log.levels.ERROR, {
					title = "Task failed",
					timeout = false,
					replace = notifyRecord,
				})
			end

			-- Process the accumulated output
			local output = table.concat(output_data, "\n")

			local qf_list = task.output_parser(output)

			-- Set the quickfix list
			vim.fn.setqflist(qf_list, "r")

			-- Print the number of issues found
			local issue_count = #qf_list
			if issue_count > 0 then
				vim.notify(task.label .. " completed", vim.log.levels.INFO, {
					title = task.label .. " found " .. issue_count .. " issue(s)",
					timeout = 5000,
					replace = notifyRecord,
				})
			else
				vim.notify(task.label .. " completed", vim.log.levels.INFO, {
					title = "No " .. task.label .. " issues found",
					timeout = 5000,
					replace = notifyRecord,
				})
			end
			vim.cmd("copen")
		end,
	})
end

for _, task in ipairs(tasks) do
	vim.api.nvim_create_user_command(task.name, function()
		create_task_command(task)
	end, {})
end

local last_command = nil

local function select_and_run_command()
	local cmds = vim.tbl_map(function(task)
		return task.name
	end, tasks)

	vim.ui.select(cmds, { prompt = "Select a task:" }, function(choice)
		if choice then
			last_command = choice
			vim.cmd(choice)
		end
	end)
end

local function run_last_command()
	if last_command then
		vim.cmd(last_command)
	else
		print("No command has been run yet.")
	end
end

vim.api.nvim_create_user_command("RunTask", select_and_run_command, {})
vim.api.nvim_create_user_command("RunLastTask", run_last_command, {})

vim.api.nvim_set_keymap("n", "<A-n>", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-p>", ":cprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":RunTask<CR>", { noremap = true, silent = true })

-- Define a highlight group
vim.cmd("highlight MyHighlight guibg=gray ctermbg=gray")

function HighlightSelectedText()
	-- Get the current buffer
	local buf = vim.api.nvim_get_current_buf()

	-- Get the start and end positions of the visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local start_line = start_pos[2] - 1 -- Convert to 0-based indexing
	local start_col = start_pos[3] - 1 -- Convert to 0-based indexing
	local end_line = end_pos[2] - 1
	local end_col = end_pos[3]

	-- Validate end_col to avoid out-of-range errors
	local line_length = #vim.api.nvim_buf_get_lines(buf, end_line, end_line + 1, false)[1]
	end_col = math.min(end_col, line_length)

	-- Create a namespace for extmarks
	local ns_id = vim.api.nvim_create_namespace("HighlightNamespace")

	-- Add the extmark with highlighting
	vim.api.nvim_buf_set_extmark(buf, ns_id, start_line, start_col, {
		end_line = end_line,
		end_col = end_col,
		hl_group = "MyHighlight",
	})
end

-- Clear highlights
function ClearHighlights()
	local buf = vim.api.nvim_get_current_buf()
	local ns_id = vim.api.nvim_create_namespace("HighlightNamespace")
	vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
end

-- Commands
vim.api.nvim_create_user_command("HighlightSelected", HighlightSelectedText, { range = true })
vim.api.nvim_create_user_command("ClearHighlight", ClearHighlights, {})
