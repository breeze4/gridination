local grid = Bitmap.new(Texture.new("gfx/grid-1280x800.png"))
stage:addChild(grid)
	
nextType = 1

local function onTouchesBegin(event)
	
	local knight1 = Bot.new(nextType, event.touch.x, event.touch.y)
	nextType = nextType + 1
	stage:addChild(knight1)	
	
	if nextType == 2 then
		nextType = 0
	end
	
end

stage:addEventListener(Event.TOUCHES_BEGIN, onTouchesBegin)

