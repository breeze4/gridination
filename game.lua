
fieldNodes = {} --gameboard for nodes

for h = 0, FIELD_HEIGHT do
	fieldNodes[h] = {}
	for w = 0, FIELD_WIDTH do
		node = Node.new(w, h)
		--print("node x: " .. node.x .. " y: " .. node.y)
		node:addChild(Bitmap.new(Texture.new("gfx/node-off-24x24.png")))
		node:setPosition(WIDTH_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*w, HEIGHT_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*h)
		node:addEventListener(Event.TOUCHES_END, Node.onTouch, node)
		
		fieldNodes[h][w] = node
		stage:addChild(node)
	end
end

