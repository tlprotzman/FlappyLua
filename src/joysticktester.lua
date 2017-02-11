



require "class"

JoystickTester = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function JoystickTester:_init(game)
	-- this is for the draw stack
	self.drawUnder = false
	self.updateUnder = false

	self.game = game
	self.joysticks = love.joystick.getJoysticks()
end

function JoystickTester:load()
	-- run when the level is given control
	self.joysticks = love.joystick.getJoysticks()
end

function JoystickTester:leave()
	-- run when the level no longer has control
end

function JoystickTester:draw()
	for i,j in pairs(self.joysticks) do
		love.graphics.print(j:getName(), 10, 10 + (i - 1)*20)
	end
end

function JoystickTester:update(dt)
	--
end

function JoystickTester:resize(w, h)
	--
end

function JoystickTester:keypressed(key, unicode)
	--
	self.game:popScreenStack()
end

function JoystickTester:keyreleased(key, unicode)
	--
end

function JoystickTester:mousepressed(x, y, button)
	--
end

function JoystickTester:mousereleased(x, y, button)
	--
end