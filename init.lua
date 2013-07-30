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