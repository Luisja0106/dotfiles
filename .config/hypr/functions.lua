-- Utilites

-- notification

local noti_queue = {}
local noti_is_running = false

local function process_queue()
	if #noti_queue == 0 then --shutdown in case that doesn't exist items in the queue
		noti_is_running = false
		return
	end

	noti_is_running = true

	local current = table.remove(noti_queue, 1) --FIFO

	hl.notification.create({ --create the notification
		text = current.text,
		duration = current.duration,
		icon = current.icon,
		color = current.color,
		font_size = current.font_size,
	})

	local delay_total = current.duration - 300 --delay for more orden

	hl.timer(function() --create the timer
		process_queue()
	end, { timeout = delay_total, type = "oneshot" })
end

--Funciones globales (llamables desde terminal)

--send built in notifications
function Send_notification(text, duration, icon, color, font_size)
	table.insert(noti_queue, {
		text = text,
		duration = duration or 1000,
		icon = icon or -1,
		color = color or "#94e2d5",
		font_size = font_size or 20,
	})

	if not noti_is_running then
		process_queue()
	end
end

--activate gamemode (optimized for gaming, remove animations, blur, change kb layout, etc)

function Activate_gamemode()
	hl.config({
		--acciones

		animations = { enabled = false },
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			active_opacity = 1.0,
			inactive_opacity = 1.0,
			fullscreen_opacity = 1.0,
			rounding = 0,
		},
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 1,
		},
		input = {
			kb_layout = "latam",
			kb_variant = "",
		},
	})
	hl.dispatch(hl.dsp.exec_cmd("killall elephant"))
	hl.dispatch(hl.dsp.exec_cmd("killall walker"))
	hl.dispatch(hl.dsp.exec_cmd("tmux kill-server"))
	hl.unbind("SUPER + CTRL + RETURN")
	hl.unbind("SUPER + SHIFT + RETURN")
	hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd("rofi -show drun"), { description = "Open application launcher" })
	hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("rofi -show run"), { description = "Open command runner" })

	--notficaciones
	local time_between = 1000
	Send_notification("Activating Gamemode", time_between, 1, "#94e2d5")
	Send_notification("Removed Animations and Blur", time_between, 1, "#94e2d5")
	Send_notification("Switch to rofi for better performance", time_between, 1, "#94e2d5")
	Send_notification("Switch to QWERTY (latam)", time_between, 1, "#94e2d5")
	Send_notification("Gamemode Activate", time_between + 500, 5, "#94e2d5", 28)
end

--disable gamemode (restore default config, animations, blur, kb layout, etc)
function Disable_gamemode()
	hl.dispatch(hl.dsp.exec_cmd("elephant"))
	hl.dispatch(hl.dsp.exec_cmd("walker --gapplication-service"))
	hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))

	--notificationes
	Send_notification("Gamemode Disabled", 1500, 5, "#94e2d5", 28)
end
