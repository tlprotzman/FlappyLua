

require "class"

Button = class()



function Button:_init(text, x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.selected = false
	self.normalColor = {255, 84, 86}
	self.selectedColor = {255, 163, 165}
end

function Button:draw()
	if self.selected then
		love.graphics.setColor(self.selectedColor)
	else
		love.graphics.setColor(self.normalColor)
	end
	love.graphics.rectangle("fill", self.x-self.width/2, self.y-self.height/2, self.width, self.height)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("line", self.x-self.width/2, self.y-self.height/2, self.width, self.height)
end

function Button:updateMouse(mX, mY)
	if (mX > self.x and mX < self.x+self.width) then
		if (mY > self.y and mY < self.y + self.height) then
			self.selected = true
			return true
		end
	end
	return false
end

function Button:select()
	self.selected = true
end

function Button:deselect()
	self.selected = false
end