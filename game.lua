
fieldNodes = {} --gameboard for nodes

for h = 0, FIELD_HEIGHT do
	fieldNodes[h] = {}
	for w = 0, FIELD_WIDTH do
		node = Node.new(w, h)
		--print("node x: " .. node.x .. " y: " .. node.y)
		node:addChild(Bitmap.new(Texture.new("gfx/node-off-24x24.png")))
		node:setPosition(WIDTH_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*w, HEIGHT_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*h)
		node:addEventListener(Event.TOUCHES_BEGIN, Node.onTouch, node)
		
		fieldNodes[h][w] = node
		stage:addChild(node)
	end
end

fieldZones = {} --gameboard for zones
for h = 1, FIELD_HEIGHT do
	fieldZones[h] = {}
	for w = 1, FIELD_WIDTH do
		zone = Zone.new(w, h)
		--print("zone x: " .. zone.x .. " y: " .. zone.y)
		zone:addChild(Bitmap.new(Texture.new("gfx/zone-off-160x160.png")))
		
		zone:setPosition(WIDTH_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*(w-1), HEIGHT_OFFSET+(GRID_NODE_OFFSET+GRID_BORDER)*(h-1))

		--print("joined zone x: " .. fieldNodes[h-1][w-1].zoneList["bottomRight"].x .. " y: " .. fieldNodes[h-1][w-1].zoneList["bottomRight"].y)
		--print( "with node x: " .. fieldNodes[h-1][w-1].x .. " y: " .. fieldNodes[h-1][w-1].y )
		--print( "with node x: " .. fieldNodes[h-1][w].x .. " y: " .. fieldNodes[h-1][w].y )
		--print( "with node x: " .. fieldNodes[h][w].x .. " y: " .. fieldNodes[h][w].y )
		--print( "with node x: " .. fieldNodes[h][w-1].x .. " y: " .. fieldNodes[h][w-1].y )
		
		zone.nodeList["topLeft"] = fieldNodes[h-1][w-1]
		fieldNodes[h-1][w-1].zoneList["bottomRight"] = zone
		
		zone.nodeList["topRight"] = fieldNodes[h-1][w]
		fieldNodes[h-1][w].zoneList["bottomLeft"] = zone
		
		zone.nodeList["bottomRight"] = fieldNodes[h][w]
		fieldNodes[h][w].zoneList["TopLeft"] = zone
		
		zone.nodeList["bottomLeft"] = fieldNodes[h][w-1]
		fieldNodes[h][w-1].zoneList["TopRight"] = zone
		
		zone:addEventListener(Event.TOUCHES_END, Zone.onTouch, zone)
		
		fieldZones[h][w] = zone
		stage:addChild(zone)
	end
end