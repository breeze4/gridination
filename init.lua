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
	self:notifyZones(self)
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

function Node:notifyZones(self)
	local topLeftZone = self.zoneList["topLeft"]
	print("notifying from node x: " .. self.x .. " y: " .. self.y)
	for element in Node:list_iter(self.zoneList) do
		print("element: " .. element)
	end
	--Zone:notifyOfNodeActivation(self.zoneList["topLeft"])
	--print("notify zone ID: " .. tostring(topLeftZone) .. " notified zone x: " .. "topLeftZone:getBounds(stage)" .. " y: " .. "topLeftZone:getY()")
	--Zone:notifyOfNodeActivation(self.zoneList["topRight"])
	--Zone:notifyOfNodeActivation(self.zoneList["bottomRight"])
	--Zone:notifyOfNodeActivation(self.zoneList["bottomLeft"])
	--self.zoneList["topLeft"].nodeList["bottomRight"]
	--self.zoneList["topRight"].nodeList["bottomLeft"]
	--self.zoneList["bottomRight"].nodeList["topLeft"]
	--self.zoneList["bottomLeft"].nodeList["topRight"]
end

function Node:onTouch(event)
	local withinHitBox = false
	local x,y,w,h = self:getBounds(stage)
	withinHitBox = Node:checkHitBox(self, event, x, y, w, h)
	if withinHitBox and self.active == false 
	then 
		Node:activate(self)
		event:stopPropagation()	
	end
end


function Sprite:collidesWith(sprite2)
	local x,y,w,h = self:getBounds(stage)
	local x2,y2,w2,h2 = sprite2:getBounds(stage)

	return not ((y+h < y2) or (y > y2+h2) or (x > x2+w2) or (x+w < x2))
end

function Sprite:getSpriteDist(sprite2)
	--Calculate the distance between 2 vectors
	local xdiff = self:getX() - sprite2:getX()
	local ydiff = self:getY() - sprite2:getY()
	local dist = (xdiff*xdiff+ydiff*ydiff)^0.5
	return dist
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end