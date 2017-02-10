require "class"

Level = class()

function Level:_init(game)
	self.game = game

	self.sinceLastPipe = 0 
	self.frequency = 2 --Interval to draw a new pipe
	self.height = 100 -- pixels tall to make the gap
	self.pipeWidth = 100
	self.velocity = 200 --Speed of the pipes
	self.pipes = {}

	self.SCREENWIDTH = game.SCREENWIDTH
	self.SCREENHEIGHT = game.SCREENHEIGHT

	self.score = 0
end

function Level:load()
	-- run when the level is given control
end

function Level:leave()
	-- run when the level no longer has control
end

--Makes the rectangles to avoid
function Level:makeElement()
	gap = math.random(0, self.SCREENHEIGHT - self.height)
	upperPipe = {x = self.SCREENWIDTH, y = 0, w = self.pipeWidth, h = gap}	--x, y, width, height
	startLower = gap + self.height
	lowerPipe = {x = self.SCREENWIDTH, y = startLower, w = self.pipeWidth, h = self.SCREENHEIGHT - startLower}
	table.insert(self.pipes, upperPipe)
	table.insert(self.pipes, lowerPipe)
end

function Level:draw()
	for i, pipe in pairs(self.pipes) do
		if (pipe.x <self.SCREENWIDTH and pipe.x + pipe.w > 0) then
			love.graphics.setColor(40, 219, 13)
			love.graphics.rectangle("fill", pipe.x, pipe.y, pipe.w, pipe.h)
		end
	end
end

function Level:update(dt)
	moveBy = self.velocity * dt
	for i, pipe in pairs(self.pipes) do
		pipe.x = pipe.x - moveBy
	end
	self.sinceLastPipe = self.sinceLastPipe + dt
	print(self.sinceLastPipe)
	if (self.sinceLastPipe > self.frequency) then
		print(newPipe)
		self:makeElement()
		self.sinceLastPipe = 0
	end
end


function Level:resize(w, h)
	--
end

function Level:keypressed(key, unicode)
	--
end

function Level:keyreleased(key, unicode)
	--
end

function Level:mousepressed(x, y, button)
	--
end

function Level:mousereleased(x, y, button)
	--
end