-- Popup preview plugin for tmux users
local M = {}

function M:preload(file)
	if file:mime() and file:mime():find("^image/") then
		-- Open image in a floating window
		ya.manager_emit("shell", {
			cmd = string.format(
				'wezterm start --class floating-preview -- bash -c "kitty +kitten icat %s; read"',
				ya.quote(tostring(file.url))
			),
			orphan = true,
		})
	end
end

return M
