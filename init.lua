local grid = Bitmap.new(Texture.new("gfx/grid-1280x800.png"))
stage:addChild(grid)

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


--core class definitions
Node = Core.class(Sprite)

function Node:init()
	self.active = false
end

function Node:activate(self)
	self.active = true
	nodeimg = Bitmap.new(Texture.new("gfx/node-on-red-24x24.png"))
	self:addChild(nodeimg)
	print("activated node at: X=" .. self:getX() .. " Y=" .. self:getY() .. " active?: " .. tostring(self.active))
end

function Node:checkHitBox(self, event, x, y, w, h)
	x = x - NODE_SIZE
    y = y - NODE_SIZE
    w = w + NODE_SIZE + NODE_SIZE
    h = h + NODE_SIZE + NODE_SIZE
	--if the touch event is outside of hitbox, return and end
    if event.touch.x < x or event.touch.x > (x+w) then return false end
    if event.touch.y < y or event.touch.y > (y+h) then return false end
	
	return true
end

function Node:onTouch(event)
	local withinHitBox = false
	local x,y,w,h = self:getBounds(stage)
	withinHitBox = Node:checkHitBox(self, event, x, y, w, h)
	--enlarge hitbox of node event listener by the size of the node in each direction
	if withinHitBox and self.active == false 
	then 
		Node:activate(self)
		event:stopPropagation()	
	end
end

--zone class
Zone = Core.class(Sprite)

function Zone:capture(self)
	zoneimg = Bitmap.new(Texture.new("gfx/zone-red-160x160.png"))
	self:addChild(zoneimg)
end

