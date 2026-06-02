Name = "WallpaperPicker"
NamePretty = "Wallpaper Picker"
Cache = false
HideFromProviderList = true
Icon = "preferences-desktop-wallpaper"
Description = "A menu to pick wallpapers from a directory"
SearchName = true
Terminal = false

local STATE_FILE = os.getenv("XDG_RUNTIME_DIR") .. "/walker_wallpaper_route"
local REFRESH_CMD = " && walker -m menus:" .. Name

local function getPath(actual)
	local file = io.open(STATE_FILE, "r")
	if not file then
		return actual
	end

	local path = file:read("*all"):gsub("%s+$", "")
	file:close()

	if path == "" then
		return actual
	end

	return path
end

local function goBack(currentDir, baseRoute, entries)
	local parentDir = currentDir:match("(.*)/[^/]+$") or baseRoute
	local parentDirName = parentDir:match("([^/]+)$") or parentDir
	table.insert(entries, {
		Text = ".. (" .. parentDirName .. ")",
		Subtext = "Go back to the previous directory",
		Value = parentDir,
		Actions = {
			move_back = "echo '" .. parentDir .. "' > " .. STATE_FILE .. REFRESH_CMD,
		},
		Icon = "go-up",
	})
end

local function findSubDirectories(dir_handle, entries)
	for dir_path in dir_handle:lines() do
		local dirname = dir_path:match("([^/]+)$")
		if dirname then
			table.insert(entries, {
				Text = "📁" .. dirname,
				Subtext = "Subdirectory",
				Value = dir_path,
				Actions = {
					open = "echo '" .. dir_path .. "' > " .. STATE_FILE .. REFRESH_CMD,
				},
				Icon = "folder",
			})
		end
	end
end

local function findWallpapers(file_handle, entries)
	for wallpaper_path in file_handle:lines() do
		local filename = wallpaper_path:match("([^/]+)$")
		if filename then
			table.insert(entries, {
				Text = filename,
				Subtext = "Wallpaper",
				Value = wallpaper_path,
				Actions = {
					select = "awww img --transition-type random --transition-fps 144 "
						.. wallpaper_path
						.. " && rm -f "
						.. STATE_FILE,
				},
				Preview = wallpaper_path,
				PreviewType = "file",
			})
		end
	end
end
function GetEntries()
	local entries = {}
	local baseRoute = os.getenv("HOME") .. "/wallpaper"
	local currentDir = getPath(baseRoute)

	if currentDir ~= baseRoute then -- if we're not in the base directory, add an option to go back
		goBack(currentDir, baseRoute, entries)
	end

	local dir_handle = io.popen("find '" .. currentDir .. "' -maxdepth 1 -type d ! -path '" .. currentDir .. "' | sort") --find subdirectories
	if dir_handle then
		findSubDirectories(dir_handle, entries)
		dir_handle:close()
	end

	local file_handle = io.popen(
		"find '"
			.. currentDir
			.. "' -maxdepth 1 -type f \\( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' \\) | sort"
	) --find wallpapers
	if file_handle then
		findWallpapers(file_handle, entries)
		file_handle:close()
	end

	return entries
end
