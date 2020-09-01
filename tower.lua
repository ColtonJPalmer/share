local robot = require("robot")

local width = 7
local stone = 64
local glass = 64
local stone_pos = 8
local glass_pos = 16

while true do
	if stone < math.floor(width/2)+1
	then
		if stone_pos == 1
		then
			break
		end
		
		stone_pos = stone_pos - 1
		stone = 64
	end

	if glass < math.floor(width/2)
	then
		if glass_pos == 9
		then
			break
		end
		
		glass_pos = glass_pos - 1
		glass = 64
	end

	robot.up()

	for i=2,width+1,1 do
		if i % 2 == 0
		then
			robot.select(stone_pos)
			stone = stone - 1
		else
			robot.select(glass_pos)
			glass = glass - 1
		end

		robot.placeDown()

		if i ~= width+1
		then
			robot.forward()
		end
	end
	
	robot.turnAround()
end
