local f = io.popen("hostname")
local host = f:read("*l")
f:close()

local configs = {}

-- LAPTOP (elliot-arch)
configs["elliot-arch"] = function()
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "0x0",
		scale = 1,
	})
end

-- DESKTOP (the-muffinator)
configs["the-muffinator"] = function()
	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@165",
		position = "0x0",
		scale = 1,
	})
end

-- fallback
(configs[host] or configs["the-muffinator"])()
