



require "class"
require "button"

PauseMenu = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function PauseMenu:_init(args)
	-- this is for the draw stack
	self.drawUnder = false
	self.updateUnder = false
end

function PauseMenu:load()
	-- run when the level is given control
end

function PauseMenu:leave()
	-- run when the level no longer has control
end

function PauseMenu:draw()
	--
end

function PauseMenu:update(dt)
	--
end

function PauseMenu:resize(w, h)
	--
end

function PauseMenu:keypressed(key, unicode)
	--
end

function PauseMenu:keyreleased(key, unicode)
	--
end

function PauseMenu:mousepressed(x, y, button)
	--
end

function PauseMenu:mousereleased(x, y, button)
	--
end