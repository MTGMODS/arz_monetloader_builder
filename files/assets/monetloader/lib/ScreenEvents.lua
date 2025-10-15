-- by Cosmo with <3
assert(MONET_VERSION, "MonetLoader is required!")

local TOUCH_TYPE_DOWN 	= 2
local TOUCH_TYPE_UP		= 1
local TOUCH_TYPE_DRAG 	= 3

local screen = {
	DOUBLE_TAP_DELAY = 1.0,
	LONG_TOUCH_DELAY = 0.5
}
local last_tap_up = nil
local long_tap = nil
local last = {
	type = -1,
	id = -1,
	x = -1,
	y = -1
}

function long_tap_clear()
	if long_tap and not long_tap.dead then
		long_tap:terminate()
		long_tap = nil
	end
end

screen.onPreviousTouch = function(type, id, x, y)
	return type, id, x, y
end
screen.onDrag = function(x, y, id)
	return x, y, id
end
screen.onDragStart = function(x, y, id)
	return x, y, id
end
screen.onDragFinish = function(x, y, id)
	return x, y, id
end
screen.onTouchDown = function(x, y, id)
	return x, y, id
end
screen.onTouchUp = function(x, y, id)
	return x, y, id
end
screen.onLongTouch = function(x, y, id)
	return x, y, id
end
screen.onTap = function(x, y, id)
	return x, y, id
end
screen.onDoubleTap = function(x, y, id)
	return x, y, id
end

addEventHandler("onTouch", function(type, id, x, y)
	if last.type ~= -1 then
		screen.onPreviousTouch(last.type, last.id, last.x, last.y)
	end

	if type == TOUCH_TYPE_DRAG then
		if last.type == TOUCH_TYPE_DOWN then
			screen.onDragStart(last.x, last.y, last.id)
		end
		screen.onDrag(x, y, id)
		long_tap_clear()
	elseif type == TOUCH_TYPE_DOWN then
		screen.onTouchDown(x, y, id)
		long_tap = lua_thread.create(function()
			wait(screen.LONG_TOUCH_DELAY * 1000)
			screen.onLongTouch(x, y, id)
			long_tap_clear()
		end)
	elseif type == TOUCH_TYPE_UP then
		if last.type == TOUCH_TYPE_DRAG then
			screen.onDragFinish(x, y, id)
			last_tap_up = nil
		else
			screen.onTap(x, y, id)
			if last_tap_up and os.clock() - last_tap_up <= screen.DOUBLE_TAP_DELAY then
				screen.onDoubleTap(x, y, id)
				last_tap_up = nil
				long_tap_clear()
			else
				last_tap_up = os.clock()
			end
		end
		screen.onTouchUp(x, y, id)
		long_tap_clear()
	end

	last.type = type
	last.id = id
	last.x = x
	last.y = y
end)

return screen