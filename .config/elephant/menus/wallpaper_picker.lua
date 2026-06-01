Name = "WallpaperPicker"
NamePretty = "Wallpaper Picker"
Cache = true
Action = "awww img  --transition-type random --transition-fps 144 %VALUE%"
HideFromProviderList = true
Description = "A menu to pick wallpapers from a directory"
SearchName = true
Terminal = false

function GetEntries()
	local entries = {}
	local home = os.getenv("HOME")
	local wallpapers_dir = home .. "/wallpaper"

	local handle = io.popen(
		"find '"
			.. wallpapers_dir
			.. "' -maxdepth 1 -type f -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' 2>/dev/null | sort"
	)

	if handle then
		for wallpaper in handle:lines() do
			local filename = wallpaper:match("([^/]+)$")
			if filename then
				table.insert(entries, {
					Text = filename,
					Subtext = "wallpaper",
					Value = wallpaper,
					Actions = {
						-- up = "notify-send up",
						-- down = "notify-send down",
					},
					Preview = wallpaper,
					PreviewType = "file",
				})
			end
		end
		handle:close()
	end
	return entries
end
