Knight = Core.class(Bot)

function Knight:init(type, startX, startY)

	
	
	
	texture = "gfx/knight_red.png"	
		
	
	local bitmap = Bitmap.new(Texture.new(texture))
	self:addChild(bitmap)

	self.xdirection = 0
	self.ydirection = 0
	self.xspeed = 0
	self.yspeed = 0	
	self.type = type
	self.width = self:getWidth()
	self.height = self:getHeight()
	
	self:setX(startX - self.width/2)
	self:setY(startY - self.height/2)
	
	
end

