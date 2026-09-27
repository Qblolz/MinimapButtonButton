--[[
	Compatibility shims for WoW 5.4.8 (Mists of Pandaria).

	Loaded before every other addon file (see MinimapButtonButton.toc), so the
	shims are available when the XML-included scripts run.
--]]

-- Mixin / CreateFromMixins were added in Legion (7.0).
if not _G.Mixin then
	function _G.Mixin(object, ...)
		for i = 1, select("#", ...) do
			local mixin = select(i, ...)
			if mixin then
				for k, v in pairs(mixin) do
					object[k] = v
				end
			end
		end
		return object
	end
end

if not _G.CreateFromMixins then
	function _G.CreateFromMixins(...)
		return _G.Mixin({}, ...)
	end
end

-- C_Timer was added in Warlords of Draenor (6.0).
if not _G.C_Timer then
	local timers = {}
	local nextID = 0
	local running = false

	local driver = CreateFrame("Frame")
	local function onUpdate(_, elapsed)
		local now = GetTime()
		local any = false
		for id, timer in pairs(timers) do
			if now >= timer.at then
				timers[id] = nil
				timer.func()
			else
				any = true
			end
		end
		if not any then
			running = false
			driver:SetScript("OnUpdate", nil)
		end
	end

	local function after(delay, func)
		nextID = nextID + 1
		timers[nextID] = { at = GetTime() + (delay or 0), func = func }
		if not running then
			running = true
			driver:SetScript("OnUpdate", onUpdate)
		end
		return nextID
	end

	_G.C_Timer = {
		-- Supports both C_Timer.After(delay, func) and C_Timer:After(delay, func).
		After = function(first, second, third)
			if first == _G.C_Timer then
				return after(second, third)
			end
			return after(first, second)
		end,
	}
end

-- issecurevariable exists in 5.4.8; the fallback only guards against removal.
if not _G.issecurevariable then
	function _G.issecurevariable() return false end
end
