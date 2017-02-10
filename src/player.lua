require "class"

Player = class()



function Player:_init(level)
	
	self.level = level
	
	self.jumpAmount = 10
	self.gravity = 3
	self.x = 50
	self.y = 50
	self.vx = 0
	self.vy = 0
	
	self.color = color
	self.size = 10

	self.SCREENWIDTH = love.graphics.getWidth()
	self.SCREENHEIGHT = love.graphics.getHeight()

end

function Player:resize(screenWidth, screenHeight)
	self.SCREENWIDTH = screenWidth
	self.SCREENHEIGHT = screenHeight
end

function Player:draw()
	love.graphis.setColor (225, 200, 0)
	love.graphics.rectangle( "fill", self.x, self.y, self.size, self.size )
end

function Player:keypressed(key)
	if key == "space" and not self.dead then
		self.vy = self.vy - self.jumpAmount
	end
end

function Player:die()
	self.dead = true
	self.vy = -jumpAmount
end

function Player:update(dt)
	self.vy = self.vy + self.gravity
	
	for i, pipe in pairs(self.level.pipes) do
		if self.x + self.size > pipe.x and self.x < pipe.x + pipe.w then
			if self.y + self.size > pipe.y and self.y < pipe.y + pipe.h then
				self:die()
			end
		end
	end
	if self.y + self.size > self.level.ground then
		if not self.dead then
			self:die()
		end
		self.y = self.level.ground - self.size
	end
end
