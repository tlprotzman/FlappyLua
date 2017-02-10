require "class"

Level = class()

function Level:_init(game)
	self.game = game

	self.sinceLastPipe = 0 
	self.frequency = 2 --Interval to draw a new pipe
	self.height = 100 -- pixels tall to make the gap
	self.pipeWidth = 40
	self.velocity = 5 --Speed of the pipes
	self.pipes = {}

	self.SCREENWIDTH = game.SCREENWIDTH
	self.SCREENHEIGHT = game.SCREENHEIGHT

	self.score = 0
end

--Makes the rectangles to avoid
function Level:makeElement()
	gap = math.random(0, self.SCREENHEIGHT - self.height)
	upperPipe = {x = self.SCREENWIDTH, y = 0, w = self.pipeWidth, h = gap}	--x, y, width, height
	startLower = gap + self.height
	lowerPipe = {x = self.SCREENWIDTH, y = startLower, w = self.pipeWidth, h = self.SCREENHEIGHT - startLower}
	pipes.insert(upperPipe)
	pipes.insert(lowerPipe)
end

function Level:draw()
	for i, pipe in pairs(pipes) do
		if (pipe.x <self.SCREENWIDTH and pipe.x + pipe.w > 0) then
			love.graphics.setColor(40, 219, 13)
			love.graphics.rectangle("fill", pipe.x, pipe.y, pipe.w, pipe.h)
		end
	end
end

function Level:update(dt)
	moveBy = self.velocity * dt
	for i, pipe in pairs(pipes) do
		pipe.x = pipe.x - moveBy
	end
	self.sinceLastPipe = self.sinceLastPipe + dt
	if (self.sinceLastPipe > self.frequency) then
		self:makeElement()
	end
end