local grid = Bitmap.new(Texture.new("gfx/grid-1280x800.png"))
stage:addChild(grid)

--core class definitions
Node = Core.class(Sprite)

function Node:activate(self)
	nodeimg = Bitmap.new(Texture.new("gfx/node-on-red-24x24.png"))
	self:addChild(nodeimg)
end

function Node:onTouch(event)


	--enlarge hitbox of node event listener by the size of the node in each direction
	local x,y,w,h = self:getBounds(stage)
    x = x - NODE_SIZE
    y = y - NODE_SIZE
    w = w + NODE_SIZE + NODE_SIZE
    h = h + NODE_SIZE + NODE_SIZE
	--if the touch event is outside of hitbox, return and end
    if event.touch.x < x or event.touch.x > (x+w) then return end
    if event.touch.y < y or event.touch.y > (y+h) then return end
	
	Node:activate(self)
	print("activated node at: X=" .. self:getX() .. " Y=" .. self:getY())
	event:stopPropagation()
end