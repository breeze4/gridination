Bot = Core.class(Sprite)

function Bot:init(type, startX, startY)

	texture = "gfx/knight.png"
	
	if type == 0 then
		texture = "gfx/knight_blue.png"
	elseif type == 1 then
		texture = "gfx/knight_red.png"
	end
		
	
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

	
	
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end


function Bot:onEnterFrame(event)
	local x, y = self:getPosition()

	x = x + (self.xspeed * self.xdirection)
	y = y + (self.yspeed * self.ydirection)
	
	if x < 0 then
		self.xdirection = 1
	end
		
	if x > 800 - self.width then
		self.xdirection = -1
	end

	if y < 0 then
		self.ydirection = 1
	end
		
	if y > 1280 - self.height then
		self.ydirection = -1
	end

	self:setPosition(x, y)
end

nextType = 1

function Bot:onTouchesBegin(event)

	local knight1 = Bot.new(nextType, event.touch.x, event.touch.y)
	nextType = nextType + 1
	stage:addChild(knight1)	

	if nextType == 2 then
		nextType = 0
	end

end

stage:addEventListener(Event.TOUCHES_BEGIN, onTouchesBegin)