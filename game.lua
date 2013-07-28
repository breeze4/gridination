--constants
FIELD_HEIGHT = 8
FIELD_WIDTH = 5
GRID_SIZE = 160
NODE_SIZE = 25
GRID_NODE_OFFSET = 148 --GRID_SIZE - CEIL(NODE_SIZE/2)

field = {} --gameboard

Node = Core.class(Sprite)

function Node:activate(self)
	node1img = Bitmap.new(Texture.new("gfx/node-on-red-25x25.png"))
	self:addChild(node1img)
end

function Node:onTouch(event)
	if self:hitTestPoint(event.touch.x, event.touch.y) then
		local x = event.touch.x
		local y = event.touch.y
		print("touched: X=" .. x .. " Y=" .. y)
		Node:activate(self)
		event:stopPropagation()
	end
end

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

for h = 0, FIELD_HEIGHT do
	field[h] = {}
	for w = 0, FIELD_WIDTH do
		node = Sprite.new()
		node:addChild(Bitmap.new(Texture.new("gfx/node-off-25x25.png")))
		node:setPosition(GRID_NODE_OFFSET*w, GRID_NODE_OFFSET*h)
		node:addEventListener(Event.TOUCHES_END, Node.onTouch, node)
		field[h][w] = node
		stage:addChild(node)
	end
end