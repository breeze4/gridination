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
	local x,y,w,h = self:getBounds(stage)
	--print("original bounds: X=" .. x .. " Y=" .. y .. " W=" .. w .. " H=" .. h)
    x = x - NODE_SIZE
    y = y - NODE_SIZE
    w = w + NODE_SIZE + NODE_SIZE
    h = h + NODE_SIZE + NODE_SIZE
	--print("extended bounds to: X=" .. x .. " Y=" .. y .. " W=" .. w .. " H=" .. h)
 
    if event.touch.x < x or event.touch.x > (x+w) then return end
    if event.touch.y < y or event.touch.y > (y+h) then return end
	
	Node:activate(self)
	print("activated node at: X=" .. self:getX() .. " Y=" .. self:getY())
	event:stopPropagation()
end

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