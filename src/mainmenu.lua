



require "class"
require "button"

MainMenu = class()

-- _init, load, draw, update(dt), keypressed, keyreleased, mousepressed, mousereleased, resize, (drawUnder, updateUnder)

function MainMenu:_init(game)
	-- this is for the draw stack
	self.drawUnder = false
	self.updateUnder = false

	self.game = game
	self.SCREENWIDTH = self.game.SCREENWIDTH
	self.SCREENHEIGHT = self.game.SCREENHEIGHT
	self.font = love.graphics.newFont(32)
	self.fontHeight = self.font:getHeight()

	self.buttons = { play = Button("Play", 300, 400, 200, 75, self.fontHeight),
					 quit = Button("Quit", 300, 500, 200, 75, self.fontHeight),
					 test = Button("Test", 300, 600, 200, 75, self.fontHeight),
					}
					
	self.image = love.graphics.newImage('mainmenu.png')
end

function MainMenu:load()
	-- run when the level is given control
	love.graphics.setFont(self.font)
	love.mouse.setVisible(true)
	love.graphics.setBackgroundColor(255, 255, 255)
end

function MainMenu:leave()
	-- run when the level no longer has control
end

function MainMenu:draw()

	love.graphics.draw(self.image, 130, 100, 0, 1, 1)
	for k, v in pairs(self.buttons) do
		v:draw()
	end
end

function MainMenu:update(dt)
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	for k, v in pairs(self.buttons) do
		v:updateMouse(mX, mY)
	end
end

function MainMenu:resize(w, h)
	--
end

function MainMenu:keypressed(key, unicode)
	--
end

function MainMenu:keyreleased(key, unicode)
	--
end

function MainMenu:mousepressed(x, y, button)
	--
end

function MainMenu:mousereleased(x, y, button)
	for k, v in pairs(self.buttons) do
		if v:updateMouse(x, y) then
			-- print(v.text .. " was pressed")
			if v.text == "Quit" then
				love.event.quit()
			elseif v.text == "Play" then
				self.game.level:reset()
				self.game:addToScreenStack(self.game.level)
			elseif v.text == "Test" then
				self.game:addToScreenStack(self.game.joystickTester)
			end
		end
	end
end