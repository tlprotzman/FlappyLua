



require "class"

JoystickTester = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function JoystickTester:_init(game)
	-- this is for the draw stack
	self.drawUnder = false
	self.updateUnder = false
	self.joysticks = love.joystick.getJoysticks()
	self.game = game
end

function JoystickTester:load()
	-- run when the level is given control
	self.joysticks = love.joystick.getJoysticks()
end

function JoystickTester:leave()
	-- run when the level no longer has control
end

function JoystickTester:draw()
    for i, joystick in ipairs(self.joysticks) do
        love.graphics.print(joystick:getName(), 10, i * 20)
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
end

function JoystickTester:keyreleased(key, unicode)
	--
	if key == "escape" then
		self.game:popScreenStack()
	end
end

function JoystickTester:mousepressed(x, y, button)
	--
end

function JoystickTester:mousereleased(x, y, button)
	--
end