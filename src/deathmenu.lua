



require "class"
require "button"

DeathMenu = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function DeathMenu:_init(game)
	-- this is for the draw stack
	self.game = game
	self.drawUnder = true
	self.updateUnder = false
	self.font = love.graphics.newFont(32)
	self.fontHeight = self.font:getHeight()
	self.score = 0
	self.buttons = { Retry = Button("Retry", 300, 400, 200, 75, self.fontHeight),
					 Exit = Button("Exit", 300, 500, 200, 75, self.fontHeight),
					}
end

function DeathMenu:load()
	-- run when the level is given control
	love.graphics.setFont(self.font)
	love.mouse.setVisible(true)
end

function DeathMenu:leave()
	-- run when the level no longer has control
end

function DeathMenu:setLatestScore(score)
	self.score = score
end

function DeathMenu:draw()
	love.graphics.printf("YOU DIED!", 300, 125, 1000, "center")
	love.graphics.printf("Score: "..self.score, 300, 175, 1000, "center")
	for k, v in pairs(self.buttons) do
		v:draw()
	end
end

function DeathMenu:update(dt)
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	for k, v in pairs(self.buttons) do
		v:updateMouse(mX, mY)
	end
end

function DeathMenu:resize(w, h)
	--
end

function DeathMenu:keypressed(key, unicode)
	--
end

function DeathMenu:keyreleased(key, unicode)
	--
end

function DeathMenu:mousepressed(x, y, button)
	--
end

function DeathMenu:mousereleased(x, y, button)
	for k, v in pairs(self.buttons) do
		if v:updateMouse(x, y) then
			-- print(v.text .. " was pressed")
			if v.text == "Exit" then
				self.game:popScreenStack()
				self.game:popScreenStack()
			elseif v.text == "Retry" then
				self.game.level:reset()
				self.game:popScreenStack()
			end
		end
	end
end