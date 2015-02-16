function love.load()

	player = {
		position = {33, 33}, 
		velocity = {0, 0}, 
		direction = 0, 
		speed = 100, 
		run = 200, 
		phase = 0, 
		tileset = love.graphics.newImage("player.png")
	}

	game_score = 0
	game_time = "03:24"
	

	
	
	
-- WORLD TILING
	
	world_tileset = love.graphics.newImage("countryside.png")	-- Loading image tileset for drawing world
	
	-- Quads for drawing world
	world_quads = {
		love.graphics.newQuad(0, 0, 32, 32, 64, 64), 	-- Grass Quad
		love.graphics.newQuad(0, 32, 32, 32, 64, 64), 	-- Flowers Quad
		love.graphics.newQuad(32, 0, 32, 32, 64, 64), 	-- Box Quad
		love.graphics.newQuad(32, 32, 32, 32, 64, 64), 	-- Panel Quad
	}
	
	-- World map layout
	world_map = {
	
		{4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4}, 
		{4, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 4}, 
		{4, 1, 2, 1, 4, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 2, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 2, 1, 1, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 2, 4, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 2, 1, 4, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 4, 1, 2, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 1, 2, 1, 4}, 
		{4, 1, 1, 1, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 1, 2, 1, 4}, 
		{4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 4}, 
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4}, 
		{3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}, 
		{4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}, 
	
	}
	
-- // WORLD TILING
	
	
	


	win_width = love.graphics.getWidth()
	win_height = love.graphics.getHeight()

-- love.graphics.setNewFont("cartoon.ttf", 16)

end
	


function love.update(dt)
	
	-- check for controls
	player_stop()
	
	if love.keyboard.isDown("up") then
		player_set_direction("N")
	end
	
	if love.keyboard.isDown("down") then
		player_set_direction("S")
	end
	
	if love.keyboard.isDown("left") then
		player_set_direction("W")
	end
	
	if love.keyboard.isDown("right") then
		player_set_direction("E")
	end
	
	player_update(dt)
	
	
	game_time = 180 - love.timer.getTime()
	

end




function love.draw()



	for rowIndex=1, #world_map do

		local row = world_map[rowIndex]

		for columnIndex=1, #row do
			local number = row[columnIndex]
			love.graphics.drawq(world_tileset, world_quads[number], (columnIndex-1) * 32, (rowIndex-1) * 32)
	    end

	end
	


	player_draw()
	
	love.graphics.printf("Score: " .. game_score, 10, win_height - 18, 800, "left")
	love.graphics.printf("Timer: " .. game_time, 10, win_height - 18, win_width - 10, "right")
	
	love.graphics.setBackgroundColor(0, 0, 0)
		

	
end






-- PLAYER FUNCTIONS AND SHIT - OUTSIDE OF MAIN LOVE LOOPS/FUNCTIONS



function player_draw()

	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.drawq(
		player.tileset,
		love.graphics.newQuad(math.floor(player.phase) * 32, player.direction * 32 , 32, 32, 256, 128),
		player.position[1],
		player.position[2]
	)	

end



function player_set_direction(dir)


-- WALKING EAST

	if (dir=="E" and not check_collision(player.position[1], player.position[2], 32, 32, win_width, 0, 0, win_height)) then
		
	-- FUNCTION/CLASS ALL THIS OUT!!!	
		for rowIndex=1, #world_map do

			local row = world_map[rowIndex]

			for columnIndex=1, #row do
				local number = row[columnIndex]
			
			
			
				if (check_collision(player.position[1] + 1, player.position[2] - 32, 32, 32, (columnIndex-1) * 32, (rowIndex-1) * 32, 32, 32)) then
				
					-- If it's a box or a panel
					if (number == 3 or number == 4) then
				
						player.velocity = {0, 0}
						player.direction = 0
				
					else
				
						player.velocity = {1, 0}
						player.direction = 0
					end
				end
			end
		end
	end

-- // WALKING EAST


-- WALKING SOUTH

	if (dir=="S" and not check_collision(player.position[1], player.position[2], 32, 32, 0, win_height, win_width, 0)) then
		
	-- FUNCTION/CLASS ALL THIS OUT!!!	
		for rowIndex=1, #world_map do

			local row = world_map[rowIndex]

			for columnIndex=1, #row do
				local number = row[columnIndex]
			
			
			
				if (check_collision(player.position[1], player.position[2] + 1, 32, 32, (columnIndex-1) * 32, (rowIndex-1) * 32, 32, 32)) then
				
					-- If it's a box or a panel
					if (number == 3 or number == 4) then
				
						player.velocity = {0, 0}
						player.direction = 1
				
					else
				
						player.velocity = {0, 1}
						player.direction = 1
					end
				end
			end
		end
	end
	
-- // WALKING SOUTH
	
	
-- WALKING WEST

	if (dir=="W" and not check_collision(player.position[1], player.position[2], 32, 32, 0, 0, 0, win_height)) then
		
	-- FUNCTION/CLASS ALL THIS OUT!!!	
		for rowIndex=1, #world_map do

			local row = world_map[rowIndex]

			for columnIndex=1, #row do
				local number = row[columnIndex]
			
			
			
				if (check_collision(player.position[1] - 32, player.position[2], 32, 32, (columnIndex-1) * 32, (rowIndex-1) * 32, 32, 32)) then
				
					-- If it's a box or a panel
					if (number == 3 or number == 4) then
				
						player.velocity = {0, 0}
						player.direction = 2
				
					else
				
						player.velocity = {-1, 0}
						player.direction = 2
					end
				end
			end
		end
	end

-- // WALKING WEST




-- WALKING NORTH

	if (dir=="N" and not check_collision(player.position[1], player.position[2], 32, 32, 0, 0, win_width, 0)) then
			
		
	-- FUNCTION/CLASS ALL THIS OUT!!!	
		for rowIndex=1, #world_map do

			local row = world_map[rowIndex]

			for columnIndex=1, #row do
				local number = row[columnIndex]
			
			
			
				if (check_collision(player.position[1] - 32, player.position[2] - 34, 32, 32, (columnIndex-1) * 32, (rowIndex-1) * 32, 32, 32)) then
				
					-- If it's a box or a panel
					if (number == 3 or number == 4) then
				
						player.velocity = {0, 0}
						player.direction = 3
				
					else
				
						player.velocity = {0, -1}
						player.direction = 3
				
					end
				end
			end
		end
	end
	
-- // WALKING NORTH
	
	
	
	
	


-- COLLISION DETECTION
	
	for rowIndex=1, #world_map do

		local row = world_map[rowIndex]

		for columnIndex=1, #row do
			local number = row[columnIndex]
			
			
			
			if (check_collision(player.position[1], player.position[2], 32, 32, (columnIndex-1) * 32, (rowIndex-1) * 32, 32, 32)) then
				
				-- If it's a box or a panel
				if (number == 4 or number == 3) then
				
					print("collision - " .. player.position[1] .. " x " .. player.position[2] .. " - " .. (columnIndex-1) * 32 .. " x " .. (rowIndex-1) * 32 .. " - " .. number)
					
				end
				
			end
			
			
			
--			print(player.position[1] player.position[2] 32 32 columnIndex-1*32 32 rowIndex-1*32 32)
--			love.graphics.drawq(world_tileset, world_quads[number], (columnIndex-1) * 32, (rowIndex-1) * 32)


	    end

	end

-- // COLLISION DETECTION	
	
	
	

end



function player_stop()

	player.velocity = {0, 0}

end



function player_update(dt)

	-- stop animation
	if (player.velocity[1] == 0 and player.velocity[2] == 0) then 
		player.phase = 0
		return 
	end
	
	
	
	
		-- move
		player.position[1] = player.position[1] + player.velocity[1] * player.speed * dt
		player.position[2] = player.position[2] + player.velocity[2] * player.speed * dt

	

	-- animate
	player.phase = (player.phase + dt * 6) %4
	

end






-- START check_collision function
function check_collision(x1, y1, w1, h1, x2, y2, w2, h2)

	if x1 > (x2 + w2) or (x1 + w1) < x2 then
		return false
	end

	if y1 > (y2 + h2) or (y1 + h1) < y2 then
		return false
	end

	return true

end
-- END check_collision function







-- https://github.com/kikito/love-tile-tutorial/wiki/1a-quads-and-images	TILING

