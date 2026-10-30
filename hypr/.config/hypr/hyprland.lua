---@module 'hl'

hl.config({
	debug = {
		disable_logs = false,
	},
})

hl.bind("SUPER" .. " + " .. "Escape", hl.dsp.exec_cmd("hyprctl dispatch dpms off && hyprctl dispatch dpms on"))

hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
	misc = {
		vrr = true,
	},
	render = {
		direct_scanout = true,
	},
})

hl.env("AQUAMARINE_DRM_NO_ATOMIC", 1)

hl.env("WLR_RENDERER", "pixman")
hl.env("GTK_THEME", "Adwaita-dark")

hl.monitor({
	output = "eDP-1",
	mode = "highres highrr",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

local terminal = "kitty"

local fileManager = "nautilus"

local menu = "wofi --show drun"

--$hyprlauncher = hyprlauncher

--################

--## AUTOSTART ###

--################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

-- Or execute your favorite apps at launch like this:

--exec-once = hyprlauncher -d

-- exec-once = nm-applet &

-- exec-once = waybar & hyprpaper & firefox

--############################

--## ENVIRONMENT VARIABLES ###

--############################

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", 24)

hl.env("HYPRCURSOR_SIZE", 24)

hl.env("AQ_DISABLE_EXPLICIT_SYNC", 1)

hl.env("AQ_NO_MODIFIERS", 1)

hl.env("WLR_RENDERER", "pixman")

--####################

--## LOOK AND FEEL ###

--####################

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 8,
		border_size = 2,
		-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		--col.inactive_border = rgba(00000000)
		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "dwindle",
		col = {
			active_border = "rgba(33ccffee)", -- rgba(00ff99ee)",
			inactive_border = "rgba(595959aa)",
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration

hl.config({
	decoration = {
		rounding = 0,
		rounding_power = 1,
		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 4,
			color = "rgba(1a1a1aee)",
		},
		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#animations

hl.workspace_rule({
	workspace = 1,
	monitor = "eDP-1",
})

hl.workspace_rule({
	workspace = 3,
	monitor = "eDP-1",
})

hl.workspace_rule({
	workspace = 5,
	monitor = "eDP-1",
})

hl.workspace_rule({
	workspace = 7,
	monitor = "eDP-1",
})

hl.workspace_rule({
	workspace = 9,
	monitor = "eDP-1",
})

hl.workspace_rule({
	workspace = 2,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 4,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 6,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 8,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 10,
	monitor = "HDMI-A-1",
})

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more

hl.config({
	dwindle = {
		--pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below TEMP FIx
		preserve_split = true,
		-- You probably want this
	},
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more

hl.config({
	master = {
		new_status = "master",
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc

hl.config({
	misc = {
		force_default_wallpaper = 0,
		-- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false,
		-- If true disables the random hyprland logo / anime girl background. :(
	},
})

--############

--## INPUT ###

--############

-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
	input = {
		kb_layout = "gb",
		follow_mouse = 1,
		sensitivity = 0,
		-- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures

--#gestures {

--#    workspace_swipe = false

--#}

-- Example per-device config

-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

--##################

--## KEYBINDINGS ###

--##################

-- See https://wiki.hyprland.org/Configuring/Keywords/

local mainMod = "SUPER"

-- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

hl.bind(mainMod .. " + " .. "Q", hl.dsp.exec_cmd("kitty"))

hl.bind(mainMod .. " + " .. "C", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "M", hl.dsp.exit())

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("nautilus"))

hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("wofi --show drun"))

hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo())

-- dwindle

--bind = $mainMod, J, togglesplit, # dwindle TEMP FIX

-- Move focus with mainMod + arrow keys

hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))

hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))

hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))

hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))

hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))

hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))

hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))

hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))

hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)

hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Hyprshot and wf-recorder keybinds

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })

-- Requires playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--#############################

--## WINDOWS AND WORKSPACES ###

--#############################

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

-- Example windowrule

--windowrule = float,class:^(kitty)$,title:^(kitty)$

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })

-- Requires playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
	name = "match_class_clipse",
	match = {
		class = "^(clipse)$",
	},
	float = true,
	size = { 622, 652 },
	stay_focused = true,
})

hl.bind("ALT" .. " + " .. "V", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))

hl.bind(mainMod .. " + " .. "f", hl.dsp.exec_cmd("firefox"))

hl.bind(mainMod .. " + " .. "i", hl.dsp.exec_cmd("rfkill unblock 0 && rfkill unblock 1"))

hl.bind(mainMod .. " + " .. "a", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-3/launcher.sh"))

-- Ignore maximize requests from apps. You'll probably like this.

--windowrule = match:class *, suppress_event maximize

-- Fix some dragging issues with XWayland

-- windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0 TEMP FIX
hl.window_rule({
	name = "fix",
	match = {
		class = "^(kitty)$",
	},
	fullscreen = 0,
	maximize = 1,
})

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("kitty")
	hl.exec_cmd("firefox")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("neowall")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpm reload")
end)

if hl.plugin.dynamic_cursors then
	hl.config({
		plugin = {
			dynamic_cursors = {
				enabled = true,
				-- sets the cursor behaviour, supports these values:
				-- tilt    - tilt the cursor based on x-velocity
				-- rotate  - rotate the cursor based on movement direction
				-- stretch - stretch the cursor shape based on direction and velocity
				-- none    - do not change the cursor's behaviour
				mode = "rotate",

				-- minimum angle difference in degrees after which the shape is changed
				-- smaller values are smoother, but more expensive for hw cursors
				threshold = 2,

				-- for mode = "rotate"
				rotate = {

					-- length in px of the simulated stick used to rotate the cursor
					-- most realistic if this is your actual cursor size
					length = 24,

					-- clockwise offset applied to the angle in degrees
					-- this will apply to ALL shapes
					offset = 25.0,
				},

				-- for mode = "tilt"
				tilt = {

					-- controls how powerful the tilt is, the lower, the more power
					-- this value controls at which speed (px/s) the full tilt is reached
					limit = 5000,

					-- relationship between speed and tilt, supports these values:
					-- linear             - a linear function is used
					-- quadratic          - a quadratic function is used (most realistic to actual air drag)
					-- negative_quadratic - negative version of the quadratic one, feels more aggressive
					-- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
					activation = "negative_quadratic",

					-- time window (ms) over which the speed is calculated
					-- higher values will make slow motions smoother but more delayed
					window = 200,

					-- full tilt for each side (°)
					full = 60,
				},

				-- for mode = "stretch"
				stretch = {

					-- controls how much the cursor is stretched
					-- this value controls at which speed (px/s) the full stretch is reached
					-- the full stretch being twice the original length
					limit = 3000,

					-- relationship between speed and stretch amount, supports these values:
					-- linear             - a linear function is used
					-- quadratic          - a quadratic function is used
					-- negative_quadratic - negative version of the quadratic one, feels more aggressive
					-- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
					activation = "quadratic",

					-- time window (ms) over which the speed is calculated
					-- higher values will make slow motions smoother but more delayed
					window = 100,
				},

				-- configure shake to find
				-- magnifies the cursor if its is being shaken
				shake = {

					-- enables shake to find
					enabled = true,

					-- controls how soon a shake is detected
					-- lower values mean sooner
					threshold = 3,

					-- magnification level immediately after shake start
					base = 4.0,
					-- magnification increase per second when continuing to shake
					speed = 4.0,
					-- how much the speed is influenced by the current shake intensity
					influence = 0.0,

					-- maximal magnification the cursor can reach
					-- values below 1 disable the limit (e.g. 0)
					limit = 0.0,

					-- time in milliseconds the cursor will stay magnified after a shake has ended
					timeout = 2000,

					-- show cursor behaviour `tilt`, `rotate`, etc. while shaking
					effects = true,

					-- enable ipc events for shake
					-- see the `ipc` section below
					ipc = false,
				},

				-- use hyprcursor to get a higher resolution texture when the cursor is magnified
				-- see the `hyprcursor` section below
				hyprcursor = {

					-- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
					-- this will also have effect without hyprcursor support being enabled
					-- 0 - never use pixelated scaling
					-- 1 - use pixelated when no highres image
					-- 2 - always use pixelated scaling
					nearest = 1,

					-- enable dedicated hyprcursor support
					enabled = true,

					-- resolution in pixels to load the magnified shapes at
					-- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
					-- -1 means we use [normal cursor size] * [shake:base option]
					resolution = -1,

					-- shape to use when clientside cursors are being magnified
					-- see the shape-name property of shape rules for possible names
					-- specifying clientside will use the actual shape, but will be pixelated
					fallback = "clientside",
				},
			},
		},
	})
	hl.plugin.dynamic_cursors.shape_rule({ shape = "text", rotate = { offset = 90.0 } })
end
