require "class"

Player = class()

--Screensize = 600x800

function Player:_init(level)
	
	--self.level = level
	
	self.jumpAmount = 10
	self.gravity = 3
	self.x = 200
	self.y = 400
	self.vx = 0
	self.vy = 0
	self.still = true
	
	self.color = color
	self.size = 10
	
end

function Player:die()
	if not self.dead then
		self.dead = true
		self.vy = -jumpAmount
	end
end

function Player:fly()
	if key == "space" and not self.dead then
		self.vy = self.vy - self.jumpAmount
	end
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
	self.still = false
	self:fly()
end

function Game:mousepressed(x, y, button)
	self.still = false
	self:fly()
end

function Player:update(dt)

	if self.still then
		return 
	end
	
	self.vy = self.vy + self.gravity
	--[[
	for i, pipe in pairs(self.level.pipes) do
		if self.x + self.size > pipe.x and self.x < pipe.x + pipe.w then
			if self.y + self.size > pipe.y and self.y < pipe.y + pipe.h then
				self:die()
			end
		end
	end
	if self.y + self.size > self.level.ground then
		self:die()
		self.y = self.level.ground - self.size
	end]]--
end
