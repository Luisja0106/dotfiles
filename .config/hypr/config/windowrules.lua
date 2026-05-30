-- common actions
local rule = hl.window_rule
local function setWorkspace(init_class, workspace)
	rule({
		name = "set " .. init_class .. " to " .. workspace,
		match = { initial_class = init_class },
		workspace = workspace,
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
setWorkspace("helium", 1)
setWorkspace("tidal-hifi", 10)
setWorkspace("steam", 9)
setWorkspace("heroic", 9)
setWorkspace("net.lutris.Lutris", 9)
setWorkspace("com.obsproject.Studio", 8)
