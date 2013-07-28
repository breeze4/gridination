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