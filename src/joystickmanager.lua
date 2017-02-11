

require "class"

JoystickManager = class()


function JoystickManager:_init(game)
	-- self.joysticks = love.joystick.getJoysticks()
	self.joysticks = {}
	self:getJoysticks()
	self.game = game
	self.pressed = false
end

function JoystickManager:getJoysticks()
	self.joysticks = love.joystick.getJoysticks()
end

function JoystickManager:hasJoysticks()
	return #self.joysticks > 0
end

function JoystickManager:update(dt)
	for k, v in pairs(self.joysticks) do
		local buttons = v:getButtonCount()
		for i = 1, buttons do
			if v:isDown(i) then
				if not self.pressed then
					self.game:keypressed("space", " ")
					self.pressed = true
				end
				return
			end
		end
	end
	self.pressed = false
end