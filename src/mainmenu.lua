



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
	self.fontHeight = love.graphics.newFont(32):getHeight()

	self.buttons = { play = Button("Play", 300, 400, 200, 75, self.fontHeight)}
end

function MainMenu:load()
	-- run when the level is given control
	love.graphics.setFont(love.graphics.newFont(32))
	love.mouse.setVisible(true)
	love.graphics.setBackgroundColor(108, 188, 255)
end

function MainMenu:leave()
	-- run when the level no longer has control
end

function MainMenu:draw()
	--
	for k, v in pairs(self.buttons) do
		v:draw()
	end
end

function MainMenu:update(dt)
	--
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
	--
end