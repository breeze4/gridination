BotManager = Core.class(Sprite)

ListOfBots = {}

Player1Bots = {}
Player2Bots = {}

function BotManager:init()
	
	Player1Bots[0] = Bot.new(0, 100, 100)
	Player1Bots[1] = Bot.new(0, 200, 100)
	Player1Bots[2] = Bot.new(0, 700, 100)
	Player2Bots[0] = Bot.new(1, 500, 800)
	Player2Bots[1] = Bot.new(1, 600, 800)
	Player2Bots[2] = Bot.new(1, 700, 800)
	
	stage:addChild(Player1Bots[1])
	stage:addChild(Player1Bots[2])
	stage:addChild(Player1Bots[3])
	stage:addChild(Player2Bots[0])
	stage:addChild(Player2Bots[1])
	stage:addChild(Player2Bots[2])
	
	--print("Player1Bots size: " .. table.getn(Player1Bots))
	--print("Player2Bots size: " .. table.getn(Player2Bots))
	
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function BotManager:onEnterFrame(event)
	
	
	for i = 0, tablelength(Player1Bots) - 1 do
	
		Player1Bots[i]:setTarget(Player2Bots)
	end
	
	for i = 0, tablelength(Player2Bots) - 1 do
	
		Player2Bots[i]:setTarget(Player1Bots)
	end
	
	
end

--MyBotManager =  BotManager.new()
--stage:addChild(MyBotManager)

