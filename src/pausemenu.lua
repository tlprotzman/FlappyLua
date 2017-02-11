



require "class"
require "button"

PauseMenu = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function PauseMenu:_init(game)
	-- this is for the draw stack
	self.game = game
	self.drawUnder = true
	self.updateUnder = false
	self.font = love.graphics.newFont(32)
	self.fontHeight = self.font:getHeight()
	self.buttons = { resume = Button("Resume", 300, 400, 200, 75, self.fontHeight, self.game),
					 Exit = Button("Exit", 300, 500, 200, 75, self.fontHeight, self.game),
					}
end

function PauseMenu:load()
	-- run when the level is given control
	love.graphics.setFont(self.font)
	love.mouse.setVisible(true)
end

function PauseMenu:leave()
	-- run when the level no longer has control
end

function PauseMenu:draw()
	--
	for k, v in pairs(self.buttons) do
		v:draw()
	end
end

function PauseMenu:update(dt)
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	for k, v in pairs(self.buttons) do
		v:updateMouse(mX, mY)
	end
end

function PauseMenu:resize(w, h)
	--
end

function PauseMenu:keypressed(key, unicode)
	--
	if key == "escape" then
		self.game:popScreenStack()
	end
end

function PauseMenu:keyreleased(key, unicode)
	--
end

function PauseMenu:mousepressed(x, y, button)
	--
end

function PauseMenu:mousereleased(x, y, button)
	for k, v in pairs(self.buttons) do
		if v:updateMouse(x, y) then
			-- print(v.text .. " was pressed")
			if v.text == "Exit" then
				self.game:popScreenStack() -- needs to be called from the level, otherwise it will screw up probably.
				self.game:popScreenStack()
			elseif v.text == "Resume" then
				self.game:popScreenStack()
			end
		end
	end
end