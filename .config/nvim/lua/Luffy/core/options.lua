vim.cmd("let g:netrw_banner = 0")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2 --tabs in 2 spaces
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = true
vim.g.editorconfig = true
vim.opt.cursorline = true
--latex config
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = { "es" }
		vim.opt.wrap = true
	end,
})
vim.opt.spelllang = { "en" }
local function shorten_path(path)
	local shorten_if_more_than = 6 -- change this to 5, 7, etc
	-- Strip and remember the root ("/" or "~/")
	local prefix = ""
	if path:sub(1, 2) == "~/" then
		prefix = "~/"
		path = path:sub(3)
	elseif path:sub(1, 1) == "/" then
		prefix = "/"
		path = path:sub(2)
	end
	-- Split the remaining path into its components
	local parts = {}
	for part in string.gmatch(path, "[^/]+") do
		table.insert(parts, part)
	end
	-- Shorten only when there are more than shorten_if_more_than directories
	if #parts > shorten_if_more_than then
		local first = parts[1]
		local last_four = table.concat({
			parts[#parts - 3],
			parts[#parts - 2],
			parts[#parts - 1],
			parts[#parts],
		}, "/")
		return prefix .. first .. "/../" .. last_four
	end

	-- Re-attach the prefix when no shortening is needed
	return prefix .. table.concat(parts, "/")
end
-- Function to get the full path and replace the home directory with ~
local function get_winbar_path()
	local full_path = vim.fn.expand("%:p:h")
	return full_path:gsub(vim.fn.expand("$HOME"), "~")
end
-- Function to get the number of open buffers using the :ls command
local function get_buffer_count()
	return vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
end
-- Function to update the winbar
local function update_winbar()
	local home_replaced = get_winbar_path()
	local buffer_count = get_buffer_count()
	local display_path = shorten_path(home_replaced)
	vim.opt.winbar = "%#WinBar2#("
		.. buffer_count
		.. ") "
		-- this shows the filename on the left
		-- This shows the file path on the right
		.. "%*%=%#WinBar1#"
		.. display_path
	-- I don't need the hostname as I have it in lualine
	-- .. vim.fn.systemlist("hostname")[1]
end
-- Winbar was not being updated after I left lazygit
vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged" }, {
	callback = function(args)
		local old_mode = args.event == "ModeChanged" and vim.v.event.old_mode or ""
		local new_mode = args.event == "ModeChanged" and vim.v.event.new_mode or ""
		-- Only update if ModeChanged is relevant (e.g., leaving LazyGit)
		if args.event == "ModeChanged" then
			-- Get buffer filetype
			local buf_ft = vim.bo.filetype
			-- Only update when leaving `snacks_terminal` (LazyGit)
			if buf_ft == "snacks_terminal" or old_mode:match("^t") or new_mode:match("^n") then
				update_winbar()
			end
		else
			update_winbar()
		end
	end,
})
