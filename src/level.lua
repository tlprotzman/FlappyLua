require "class"

Level = class()

function Level:_init(keyboard, player, game)
	self.game = game
	self.keyboard = keyboard

	self.frequency = 2 --Interval to draw a new pipe
	self.height = 100 -- pixels tall to make the gap
	self.pipeWidth = 40
	self.pipes = {}

	self.screenX = 0

	self.SCREENWIDTH = 600
	self.SCREENHEIGHT = 800
end

--Makes the rectangles to avoid
function Level:makeElement()
	gap = math.random(0, self.SCREENHEIGHT - self.height)
	upperPipe = {x = screenX, y = 0, w = self.pipeWidth, h = gap}	--x, y, width, height
	startLower = gap + self.height
	lowerPipe = {x = screenX, y = startLower, w = self.pipeWidth, h = self.SCREENHEIGHT - startLower)
	pipes.insert(upperPipe)
	pipes.insert(lowerPipe)
end

function Level:draw()
	for i, pipe in pairs(pipes)
		if (pipe[x] < self.screenX + self.SCREENWIDTH and pipe[x] + pipe[w] > self.screenX)
			love.graphics.setColor(40, 219, 13)
			love.graphics.rectangle("fill", pipe[x], pipe[y], pipe[w], pipe[h])
		end
	end
end