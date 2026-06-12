local neovideWorkspace = {}

local function disableAnims()
	hl.animation({ leaf = "workspaces", enabled = false })
	hl.animation({ leaf = "workspacesIn", enabled = false })
	hl.animation({ leaf = "workspacesOut", enabled = false })
	hl.animation({ leaf = "specialWorkspace", enabled = false })
	hl.animation({ leaf = "windows", enabled = false })
	hl.animation({ leaf = "windowsIn", enabled = false })
	hl.animation({ leaf = "windowsOut", enabled = false })
	hl.animation({ leaf = "fade", enabled = false })
	hl.animation({ leaf = "fadeIn", enabled = false })
	hl.animation({ leaf = "fadeOut", enabled = false })
end

local function enableAnims()
	hl.animation({
		leaf = "workspaces",
		enabled = true,
		speed = 2.4,
		bezier = "bouncy",
		style = "slide",
	})
	hl.animation({
		leaf = "workspacesIn",
		enabled = true,
		speed = 2.4,
		bezier = "bouncy",
		style = "slide",
	})
	hl.animation({
		leaf = "workspacesOut",
		enabled = true,
		speed = 2.4,
		bezier = "bouncy",
		style = "slide",
	})
	hl.animation({
		leaf = "specialWorkspace",
		enabled = true,
		speed = 3,
		bezier = "bouncy",
		style = "slidevert",
	})
	hl.animation({
		leaf = "windows",
		enabled = true,
		speed = 4.79,
		bezier = "bouncy",
	})
	hl.animation({
		leaf = "windowsIn",
		enabled = true,
		speed = 4.1,
		bezier = "bouncy",
		style = "popin 77%",
	})
	hl.animation({
		leaf = "windowsOut",
		enabled = true,
		speed = 1.49,
		bezier = "linear",
		style = "popin 87%",
	})
	hl.animation({
		leaf = "fade",
		enabled = true,
		speed = 3.03,
		bezier = "quick",
	})
	hl.animation({
		leaf = "fadeIn",
		enabled = true,
		speed = 1.73,
		bezier = "almostLinear",
	})
	hl.animation({
		leaf = "fadeOut",
		enabled = true,
		speed = 1.46,
		bezier = "almostLinear",
	})
end

hl.on("window.open_early", function(w)
	if w.class == "neovide" then
		local spawner = hl.get_active_window()
		local ws = hl.get_active_workspace()
		neovideWorkspace[w.address] = {
			wsId = ws.id,
			terminal = spawner,
		}
	end
end)

hl.on("window.open", function(w)
	if w.class == "neovide" then
		local state = neovideWorkspace[w.address]
		if not state then
			return
		end
		disableAnims()
		if state.terminal then
			hl.dispatch(hl.dsp.window.move({ workspace = 99, window = state.terminal }))
		end
		hl.dispatch(hl.dsp.focus({ workspace = state.wsId }))
		hl.timer(enableAnims, { timeout = 300, type = "oneshot" })
	end
end)

hl.on("window.close", function(w)
	if w.class == "neovide" then
		local state = neovideWorkspace[w.address]
		if not state then
			return
		end
		local windows = hl.get_workspace_windows(99)
		disableAnims()
		for _, win in ipairs(windows) do
			hl.dispatch(hl.dsp.window.move({ workspace = state.wsId, window = win }))
		end
		hl.dispatch(hl.dsp.focus({ workspace = state.wsId }))
		hl.timer(enableAnims, { timeout = 300, type = "oneshot" })
		neovideWorkspace[w.address] = nil
	end
end)
