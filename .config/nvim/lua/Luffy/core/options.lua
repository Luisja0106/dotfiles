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
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
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
		return prefix .. first .. "/.../" .. last_four
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
-- Función para actualizar la winbar de forma segura
-- Función para actualizar la winbar en UNA ventana específica
local function update_single_winbar(winid)
	if not vim.api.nvim_win_is_valid(winid) then
		return
	end

	-- Nos movemos temporalmente al contexto de esa ventana para leer sus variables
	vim.api.nvim_win_call(winid, function()
		local excluded_filetypes = {
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_console",
			"dap-repl",
			"snacks_picker_input",
			"snacks_picker_list",
			"snacks_terminal",
			"NvimTree",
			"neo-tree",
			"lazy",
			"mason",
		}

		local buf_ft = vim.bo.filetype
		local win_height = vim.api.nvim_win_get_height(0)

		-- Filtros de seguridad
		if
			vim.tbl_contains(excluded_filetypes, buf_ft)
			or vim.bo.buftype == "nofile"
			or buf_ft == ""
			or win_height < 3
		then
			vim.opt_local.winbar = nil
			return
		end

		local home_replaced = get_winbar_path()
		local buffer_count = get_buffer_count()
		local display_path = shorten_path(home_replaced)

		pcall(function()
			vim.opt_local.winbar = "%#WinBar2#(" .. buffer_count .. ") " .. "%*%=%#WinBar1#" .. display_path
		end)
	end)
end

-- Función que recorre todas las ventanas y las actualiza
local function update_all_winbars()
	for _, winid in ipairs(vim.api.nvim_list_wins()) do
		update_single_winbar(winid)
	end
end

-- Autocomandos sincronizados
vim.api.nvim_create_autocmd({
	"BufEnter", -- Al entrar a un buffer
	"WinEnter", -- Al cambiar de split
	"BufAdd", -- AL CREAR UN NUEVO BUFFER (Esto arregla lo que mencionas)
	"BufDelete", -- Al cerrar un buffer (para que el conteo baje de inmediato)
	"WinResized", -- Si cambias el tamaño de los splits
}, {
	group = vim.api.nvim_create_augroup("FastSafeWinbar", { clear = true }),
	callback = function(args)
		-- Si es un picker de snacks, usamos schedule para evitar el error E36
		if vim.bo[args.buf].filetype:match("snacks_picker") then
			vim.schedule(update_all_winbars)
		else
			-- Para todo lo demás, actualización instantánea
			update_all_winbars()
		end
	end,
})
