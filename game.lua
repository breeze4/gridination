--constants
FIELD_HEIGHT = 8
FIELD_WIDTH = 5
GRID_SIZE = 160
GRID_BORDER = 1.5 --magic
GRID_NODE_OFFSET = 148 --GRID_SIZE - NODE_SIZE/2
NODE_SIZE = 24
--magic
WIDTH_OFFSET = 15
HEIGHT_OFFSET = 30

field = {} --gameboard

for h = 0, FIELD_HEIGHT do
	field[h] = {}
	for w = 0, FIELD_WIDTH do
		node = Sprite.new()
		node:addChild(Bitmap.new(Texture.new("gfx/node-off-24x24.png")))
		node:setPosition(WIDTH_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*w, HEIGHT_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*h)
		node:addEventListener(Event.TOUCHES_END, Node.onTouch, node)
		field[h][w] = node
		stage:addChild(node)
	end
end