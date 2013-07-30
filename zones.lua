--zone class
Zone = Core.class(Sprite)

function Zone:capture(self)
	print("captured zone")
	self.zoneimg = Bitmap.new(Texture.new("gfx/zone-red-160x160.png"))
	self:addChild(self.zoneimg)
end

function Zone:init(x, y)
	self.x = x
	self.y = y
	self.captured = false
	self.nodeList = {topLeft="", topRight="", bottomLeft="", bottomRight=""}
	self.zoneimg = Bitmap.new(Texture.new("gfx/zone-off-160x160.png"))
	self:addChild(self.zoneimg)
end


function Zone:checkNodeList(self)
	local allNodesActivated = false
	topLeftActive = zone.nodeList["topLeft"].active
	topRightActive = zone.nodeList["topRight"].active
	bottomRightActive = zone.nodeList["bottomRight"].active
	bottomLeftActive = zone.nodeList["bottomLeft"].active
	
	if topLeftActive or topRightActive or bottomLeftActive or bottomRightActive
	then
		print("top left corner active?: " .. tostring(topLeftActive))
		print("top right corner active?: " .. tostring(topRightActive))
		print("bottom right corner active?: " .. tostring(bottomRightActive))
		print("bottom left corner active?: " .. tostring(bottomLeftActive))

	end
	
	if topLeftActive and topRightActive and bottomLeftActive and bottomRightActive
	then allNodesActivated = true
	end
	
	return allNodesActivated
end

function Zone:notifyOfNodeActivation(self)
	local allNodesActivated = Zone:checkNodeList(self)
	print("zone ID: " .. tostring(self) .. " zone x: " .. "self.x" .. " y: " .. "self.y" .. " allNodesActivated?: " .. tostring(allNodesActivated))
	if allNodesActivated
	then
		Zone:capture(self)
	end
end