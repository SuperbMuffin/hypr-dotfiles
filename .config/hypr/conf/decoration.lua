hl.config({
	decoration = {
		rounding = 20,
		rounding_power = 3,

		active_opacity = 1,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 12,
			passes = 3,
			noise = 0.02,
			xray = true,
			popups = true,
			special = true,
			brightness = 0.7,
			vibrancy = 0.9,
			vibrancy_darkness = 0.05,
			contrast = 1,
		},
	},
})

hl.layer_rule({ match = { namespace = "quickshell" }, blur = true })
hl.layer_rule({ match = { namespace = "quickshell" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0.2 })
