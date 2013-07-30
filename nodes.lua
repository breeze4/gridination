--core class definitions
Node = Core.class(Sprite)

function Node:init(x, y)
	self.x = x
	self.y = y
	self.active = false
	self.zoneList = {topLeft="", topRight="", bottomLeft="", bottomRight=""}
end

function Node:activate(self)
	self.active = true
	nodeimg = Bitmap.new(Texture.new("gfx/node-on-red-24x24.png"))
	self:addChild(nodeimg)
	print("activated node at: X=" .. self:getX() .. " Y=" .. self:getY() .. " active?: " .. tostring(self.active))
end

function Node:checkHitBox(self, event, x, y, w, h)
	--enlarge hitbox of node event listener by the size of the node in each direction
	x = x - NODE_SIZE
    y = y - NODE_SIZE
    w = w + NODE_SIZE + NODE_SIZE
    h = h + NODE_SIZE + NODE_SIZE
	--if the touch event is outside of hitbox, return and end
    if event.touch.x < x or event.touch.x > (x+w) then return false end
    if event.touch.y < y or event.touch.y > (y+h) then return false end
	
	return true
end

function Node:list_iter (t)
      local i = 0
      local n = table.getn(t)
	  print("table getn: " .. n)
      return function ()
               i = i + 1
               if i <= n then return t[i] end
             end
    end

function Node:onTouch(event)
	--print("node touch")
	local withinHitBox = false
	local x,y,w,h = self:getBounds(stage)
	withinHitBox = Node:checkHitBox(self, event, x, y, w, h)
	if withinHitBox and self.active == false 
	then 
		Node:activate(self)
	end
end