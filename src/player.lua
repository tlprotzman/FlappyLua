require "class"

Player = class()

--Screensize = 600x800

function sign(v)
	if v==0 then
		return 0
	elseif v > 0 then
		return 1
	end
	return -1
end

function Player:_init(game)
	self.game = game


	self.jumpAmount = 15
	self.gravity = 30
	self.x = 200
	self.y = 400
	self.vx = 0
	self.vy = 0
	self.maxSpeed = 7
	
	self.still = true
	self.dead = false
	self.gameover = false
	self.py = false
	
	self.color = {225, 200, 0}
	self.size = 50
	
	self.image = love.graphics.newImage('logo.png')
	self.image2 = love.graphics.newImage('logotext.png')
	self.imagepy = love.graphics.newImage('pygame.png')
	
	if math.random()*10 > 8 then
		self.py = true
	end
	
	self.screenHeight = 800
end

function Player:reset()
	self.dead = false
	self.x = 200
	self.y = 400
	self.vx = 0
	self.vy = 0
	self.still = true
	self.gameover = false
	self.py = false
	if math.random()*10 > 8 then
		self.py = true
	end
end

function Player:die()
	if not self.dead then
		self.dead = true
		self.vy = -self.jumpAmount
	end
end

function Player:fly()
	if not self.dead and not self.still then
		if self.game.level.flipped then
			self.vy = self.jumpAmount
		else
			self.vy = -self.jumpAmount
		end
	end
end

function Player:resize(screenWidth, screenHeight)
	self.SCREENWIDTH = screenWidth
	self.SCREENHEIGHT = screenHeight
end

function Player:draw()
	--love.graphics.setColor ( unpack( self.color ) )
	--love.graphics.rectangle( "fill", self.x, self.y, self.size, self.size )
	if self.py == false then
		love.graphics.draw(self.image, self.x, self.y, 0, 1, 1)
		love.graphics.setColor ( 255, 255, 255 )
		love.graphics.draw(self.image2, self.x, self.y, 0, 1, 1)
	else
		love.graphics.setColor ( 255, 255, 255 )
		love.graphics.draw(self.imagepy, self.x, self.y, 0, 1, 1)
	end
end

function Player:keypressed(key)
	if key == "space" then
		self.still = false
		self:fly()
	end
end

function Player:mousepressed(x, y, button)
	self.still = false
	self:fly()
end

function Player:update(dt)

	-- In case game is not yet started
	-- if self.still then
	-- 	return 
	-- end
	
	-- What goes up must come down
	self.vy = self.vy + self.gravity*dt
	self.y = self.y + self.vy
	-- print(self.y)

	-- Don't go to fast
	if sign(self.vy) > self.maxSpeed then
		self.vy = sign(self.vy) * self.maxSpeed
	end
	
	-- Ground Collisions
	if self.y > self.screenHeight then
		self.dead = true
		self.gameover = true
		self.game.deathMenu:setLatestScore(self.game.level.score)
		self.game:addToScreenStack(self.game.deathMenu)
	elseif self.y < 0 then
		self.y = 0
		self.vy = 0
	end

	if self.game.level.flipped then
		self.jumpAmount = 15
		self.gravity = - 30
	else
		self.jumpAmount = 15
		self.gravity = 30
	end
end
