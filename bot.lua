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
	self.maxspeed = 3
	
	self:setX(startX - self.width/2)
	self:setY(startY - self.height/2)

	self.hasATarget = false
	self.target = nil
	self.xtarget = nil
	self.ytarget = nil
	self.wtarget = nil
	self.htarget = nil
	
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Bot:setTarget(ListOfTargets)

	distance = 1280
	closestTarget = nil
	tableLen = tablelength(ListOfTargets)
	
	--print(table.getn(ListOfTargets))
	
	if tableLen > 0 then	
		for i = 0, tableLen - 1 do
			tdiff = self:getSpriteDist(ListOfTargets[i])
			if  tdiff <= distance then
				distance = tdiff
				closestTarget = ListOfTargets[i]
			end			
		end
		
		if closestTarget == nil then
		else	
			self.hasATarget = true
			self.target = closestTarget
			self.xtarget = closestTarget:getX()
			self.ytarget = closestTarget:getY()	
			self.wtarget = closestTarget.width
			self.htarget = closestTarget.height
		end
	end

	
	
end

function Bot:onEnterFrame(event)
	local x, y = self:getPosition()

	self.xdirection = 0
	self.ydirection = 0
	self.xspeed = 0
	self.yspeed = 0	
	
	
	if self.hasATarget == nil then
	else		
		if self.hasATarget == true then	
			if self.xtarget > self:getX() then
				self.xdirection = 1
			else
				self.xdirection = -1
			end
			
			if self.ytarget > self:getY() then
				self.ydirection = 1
			else
				self.ydirection = -1
			end
			
			xAbs = math.abs(self.xtarget - x)			
			yAbs = math.abs(self.ytarget - y)
			
			if yAbs == 0 then
				self.xspeed = 0
			else
				self.xspeed = xAbs / yAbs
			end
			
			if xAbs == 0 then
				self.yspeed = 0
			else
				self.yspeed = yAbs / xAbs	
			end
						
			if xAbs == 0 or yAbs == 0 then
			else
			
				if self.xspeed > self.yspeed then
					self.yspeed = 1
				else 
					self.xspeed = 1
				end
				
				-- Max Speeds
				if self.xspeed > self.maxspeed then
					self.xspeed = self.maxspeed
				end
				if self.yspeed > self.maxspeed then
					self.yspeed = self.maxspeed
				end				
			end
			
			oldx = x
			oldy = y

			x = x + (self.xspeed * self.xdirection)
			y = y + (self.yspeed * self.ydirection)
			
			if(self:collidesWith(self.target) == true) then
				x = oldx
				y = oldy
			end
		end
	end
	
	
	
	if (x < 0) or (x > 800 - self.width) or (y < 0) or (y > 1280 - self.height) then		
	else
		self:setPosition(x, y)
	end

	
end






