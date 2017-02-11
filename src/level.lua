require "class"

Level = class()

function Level:_init(game, player)
	self.game = game
	self.player = player

	self.sinceLastPipe = 0 
	self.frequency = 2 --Interval to draw a new pipe
	self.height = 400 -- pixels tall to make the gap
	self.pipeWidth = 100
	self.velocity = 200 --Speed of the pipes
	self.pipes = {}
	self.scale = 2 -- how much the gap decreases by per point

	self.SCREENWIDTH = game.SCREENWIDTH
	self.SCREENHEIGHT = game.SCREENHEIGHT

	self.color = 200
	self.colorDirection = -1
	self.colorSpeed = 3
	self.colorStages = {{0, 0, 128}, {0, 128, 0}, {128, 0, 0}, {128, 0, 128}, {0, 128, 128}, {128, 128, 0}}
	self.colorStage = 1
	
	self.score = 0
	self:makeElement()

	self.flipped = false
end

function Level:reset()
	self.score = 0
	self.pipes = {}
	self:makeElement()
	self.player:reset()
	self.sinceLastPipe = 0
end

function Level:load()
	-- run when the level is given control
end

function Level:leave()
	-- run when the level no longer has control
end

function Level:changeColor() 
	self.color = self.color + self.colorSpeed * self.colorDirection
	if self.color < 0 then
		self.colorDirection = 1
		self.color = 0
	elseif self.color > 200 then
		self.colorDirection = -1
		self.color = 200
	end
end

--Makes the rectangles to avoid
function Level:makeElement()
	gapDistance = math.max(self.height - self.scale * self.score, 150)
	gap = math.random(0, self.SCREENHEIGHT - gapDistance)
	upperPipe = {x = self.SCREENWIDTH, y = 0-100, w = self.pipeWidth, h = gap+100, counted = false}	--x, y, width, height
	startLower = gap + gapDistance
	lowerPipe = {x = self.SCREENWIDTH, y = startLower, w = self.pipeWidth, h = self.SCREENHEIGHT - startLower+100, counted = false}
	table.insert(self.pipes, upperPipe)
	table.insert(self.pipes, lowerPipe)
end

function Level:draw()
	love.graphics.setBackgroundColor(self.color, self.color, self.color)
	for i, pipe in pairs(self.pipes) do
		if (pipe.x <self.SCREENWIDTH and pipe.x + pipe.w > 0) then
			love.graphics.setColor ( unpack(self.colorStages[self.colorStage]) )
			love.graphics.rectangle("fill", pipe.x, pipe.y, pipe.w, pipe.h, 10, 10)
			love.graphics.setColor ( 255, 255, 255 )
			if pipe.y == 0-100 then
				love.graphics.printf(math.floor((i+1)/2), pipe.x, pipe.y + pipe.h - 80, pipe.w, "center")
			else
				love.graphics.printf(math.floor((i+1)/2), pipe.x, pipe.y + 40, pipe.w, "center")
			end
		end
	end
	love.graphics.setColor ( unpack(self.colorStages[self.colorStage]) )
	self.player:draw()
end

function Level:update(dt)
	if self.player.gameover then
		return
	end

	if self.score > 10 and self.score % 2 == 0 then
		self.flipped = true
	else
		self.flipped = false
	end
	--
	self.colorStage = math.floor(self.score / 10)%6 + 1
	self.colorSpeed = 3 + (self.score / 3)
	--
	self:changeColor()
	moveBy = self.velocity * dt
	
	for i, pipe in pairs(self.pipes) do
		pipe.x = pipe.x - moveBy
		if (pipe.x + pipe.w < 200 and pipe.counted == false and not self.player.dead) then
			self.score = self.score + 0.5
			pipe.counted = true
			-- print("HIT")
		end
	end
	
	-- print(self.score)
	self.sinceLastPipe = self.sinceLastPipe + dt
	-- print(self.sinceLastPipe)
	if (self.sinceLastPipe > self.frequency) then
		-- print(newPipe)
		self:makeElement()
		self.sinceLastPipe = 0
	end
	
	-- Pipe Collisions
	if self.flipped then
		for i, pipe in pairs(self.pipes) do
			if self.player.y + self.player.size > pipe.y and self.player.y < pipe.y + pipe.w then
				if self.player.x + self.player.size > pipe.x and self.player.x < pipe.x + pipe.h then
					self.player:die()
				end
			end
		end
	else
		for i, pipe in pairs(self.pipes) do
			if self.player.x + self.player.size > pipe.x and self.player.x < pipe.x + pipe.w then
				if self.player.y + self.player.size > pipe.y and self.player.y < pipe.y + pipe.h then
					self.player:die()
				end
			end
		end
	end
	self.player:update(dt)
end

function Level:resize(w, h)
	--
end

function Level:keypressed(key, unicode)
	if (key == "escape") then
		self.game:addToScreenStack(self.game.pauseMenu)
	end
	self.player:keypressed(key, unicode)
end

function Level:keyreleased(key, unicode)
	--
end

function Level:mousepressed(x, y, button)
	--
	self.player:mousepressed(x, y, button)
end

function Level:mousereleased(x, y, button)
	--
end