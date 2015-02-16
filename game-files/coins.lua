anim8 = require 'anim8'	-- Including anim8 library

-- Function to load coins and info
function coins_load()
	
	image = love.graphics.newImage('coinanim.png')	-- Setting coin tileset image
	
	grid = anim8.newGrid(16, 16, 64, 16)	-- Setting new grid
	
	coin_animation = anim8.newAnimation('loop', grid('1-4,1'), 0.1)	-- Configuring animation
	
	-- Creating multi-dimensional table/array to hold coin positions as {x,y}
	coin_positions = {
		{168, 200}, 
		{336, 200}, 
		{106, 260}, 
		{106, 518}, 
		{520, 280}, 
		{488, 106}, 
		{680, 106}, 
		{710, 520}, 
		{520, 392}, 
		{616, 420}, 
		{264, 142}, 
		{394, 264}, 
		{72, 72}, 
		{710, 250}, 
		{488, 488}, 
		{680, 488}, 
		{336, 680}, 
		{600, 280}, 
		{618, 202}, 
		{200, 362}, 
	}
		
end
-- // Function to load coins and info


-- Function for drawing coin animations
function coins_draw()
	for k,v in pairs(coin_positions) do -- Foreach item in coin_positions
		coin_animation:draw(image, v[1], v[2])	-- Draw coin animation
	end
end
-- // Function for drawing coin animations


-- Function for updating coins after collision detection
function coins_update(dt)
	for k,v in pairs(coin_positions) do
		if (check_collision(player.position[1], player.position[2], 32, 32, v[1], v[2], 16, 16)) then	-- If player collides with coin then remove coin and update score
			table.remove(coin_positions, k)	-- Removing coin from table/array
			score_update()	-- Updating score
--			coin_audio_play()
		end
	end
	
	coin_animation:update(dt)	-- Updating coin animation
	
	if (table.getn(coin_positions) - 1 <= 0) then	-- Getting number of coins from size of array/table ( - 1 to account for one-based index
		gamestate = "win"	-- Setting gamestate to win
	end

end
-- // Function for updating coins after collision detection
