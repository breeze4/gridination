--zone class
Zone = Core.class(Sprite)

function Zone:activate(self)
	print("----captured zone---- " .. " zone x: " .. self.x .. " y: " .. self.y)
	zoneimg = Bitmap.new(Texture.new("gfx/zone-red-160x160.png"))
	self:addChild(zoneimg)
end

function Zone:init(x, y)
	self.x = x
	self.y = y
	self.captured = false
	self.nodeList = {topLeft="", topRight="", bottomLeft="", bottomRight=""}
end

function Zone:checkNodeList()
	local allNodesActivated = false
	topLeftActive = self.nodeList["topLeft"].active
	topRightActive = self.nodeList["topRight"].active
	bottomRightActive = self.nodeList["bottomRight"].active
	bottomLeftActive = self.nodeList["bottomLeft"].active
	
	if topLeftActive or topRightActive or bottomLeftActive or bottomRightActive
	then
		--print("zone ID: " .. tostring(self) .. " zone x: " .. self.x .. " y: " .. self.y)
		--print("top left corner active?: " .. tostring(topLeftActive))
		--print("top right corner active?: " .. tostring(topRightActive))
		--print("bottom right corner active?: " .. tostring(bottomRightActive))
		--print("bottom left corner active?: " .. tostring(bottomLeftActive))

	end
	
	if topLeftActive and topRightActive and bottomLeftActive and bottomRightActive
	then 
		allNodesActivated = true
		
	end
	
	return allNodesActivated
end

function Zone:onTouch(event)
	local allNodesActivated = self:checkNodeList()
	print("zone on touch: " .. tostring(allNodesActivated))
	if allNodesActivated and self.captured == false 
	then 
		print("----all nodes activated zone---- " .. " zone x: " .. self.x .. " y: " .. self.y)
		Zone:activate(self)
	end
end