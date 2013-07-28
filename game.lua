
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

local node1 = Sprite.new()
local node1img = Bitmap.new(Texture.new("gfx/node-off-25x25.png"))
node1:addChild(node1img)


local function nodeTouch(node, event)
	if node:hitTestPoint(event.touch.x, event.touch.y) then
		local x = event.touch.x
		local y = event.touch.y
		print("touched: X=" .. x .. " Y=" .. y)
	end
	node1img = Bitmap.new(Texture.new("gfx/node-on-red-25x25.png"))
	node:addChild(node1img)
end

node1:setPosition(148,148)
node1:addEventListener(Event.TOUCHES_END, nodeTouch, node1)
stage:addChild(node1)
