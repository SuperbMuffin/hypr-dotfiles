local f = io.popen("hostname")
local host = f:read("*l")
f:close()
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",

		follow_mouse = 1,
	},
})

if host == "elliot-arch" then
	hl.config({
		input = {
			sensitivity = -0.3,
			accel_profile = "adaptive",
			touchpad = {
				natural_scroll = true,
			},
		},
	})
end
