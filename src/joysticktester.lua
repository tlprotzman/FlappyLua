



require "class"

JoystickTester = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function JoystickTester:_init(args)
	-- this is for the draw stack
	self.drawUnder = false
	self.updateUnder = false
end

function JoystickTester:load()
	-- run when the level is given control
end

function JoystickTester:leave()
	-- run when the level no longer has control
end

function JoystickTester:draw()
	--
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
end

function JoystickTester:mousepressed(x, y, button)
	--
end

function JoystickTester:mousereleased(x, y, button)
	--
end