-- common actions
local rule = hl.window_rule
local MatchType = {
	class = "class",
	initial_class = "initial_class",
	title = "title",
	initial_title = "initial_title",
}

local function setWorkspace(identificator, workspace, match_type)
	local criteria = match_type or MatchType.class
	rule({
		name = "set " .. identificator .. " to " .. workspace,
		match = { [criteria] = identificator },
		workspace = workspace,
	})
end

local function setUtilities(identificator, size, match_type)
	local criteria = match_type or MatchType.class
	local window_size = size or { "(monitor_w*0.5)", "(monitor_h*0.5)" }
	rule({
		name = "set " .. identificator .. " to floating",
		match = { [criteria] = identificator },
		float = true,
		pin = true,
		center = true,
		size = window_size,
	})
end

rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

--set app to workspace
setWorkspace("helium", 1, MatchType.initial_class)
setWorkspace("tidal-hifi", 10, MatchType.initial_class)
setWorkspace("steam", 9, MatchType.initial_class)
setWorkspace("heroic", 9, MatchType.initial_class)
setWorkspace("net.lutris.Lutris", 9, MatchType.initial_class)
setWorkspace("com.obsproject.Studio", 8, MatchType.initial_class)
setWorkspace("tidal", 10, MatchType.initial_title)

--utilities apps
setUtilities("bluetui", nil, MatchType.initial_title)
setUtilities("org.pulseaudio.pavucontrol", nil, MatchType.initial_class)
setUtilities("org.nmrs.ui", nil, MatchType.initial_class)
setUtilities("btop", { "(monitor_w*0.6)", "(monitor_h*0.8)" }, MatchType.initial_title)
setUtilities("htop", { "(monitor_w*0.6)", "(monitor_h*0.8)" }, MatchType.initial_title)

--specific rules

rule({
	name = "Picture-In-Picture",
	match = {
		initial_title = "Picture in picture",
	},
	float = true,
	pin = true,
	size = { 701, 394 },
	move = { 1200, 663 },
	content = "video",
})
