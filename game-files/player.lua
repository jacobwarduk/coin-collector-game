-- Function to load player
function player_load()
	-- Creating new player object and assigning attributes
	player = {
		position = {33, 33}, 	-- Setting player's starting position
		velocity = {0, 0}, 	-- Setting player's velocity
		direction = 0, 	-- Setting player's direction
		speed = 100, 	-- Setting player's speed
		run = 200, 	-- Setting player's walking speed
		phase = 0, 	-- Setting player's phase
		tileset = love.graphics.newImage("player.png")	-- Setting image tileset to use for player
	}
end
-- // Function to load player


-- Function to stop player's movement
function player_stop()
	player.velocity = {0, 0}	-- Setting player's velocity to {0, 0} (Stopped)
end
-- // Function to stop player's movement


-- Function for updating player
function player_update(dt)
	
	-- If up arrow is pressed then player's direction set to north
	if love.keyboard.isDown("up") then
		player_set_direction("N")
	end
	
	-- If down arrow is pressed then player's direction set to south
	if love.keyboard.isDown("down") then
		player_set_direction("S")
	end
	
	-- If left arrow is pressed then player's direction set to west
	if love.keyboard.isDown("left") then
		player_set_direction("W")
	end
	
	-- If right arrow is pressed then player's direction set to east
	if love.keyboard.isDown("right") then
		player_set_direction("E")
	end
	
	-- If player is not moving then phase set to zero
	if (player.velocity[1] == 0 and player.velocity[2] == 0) then 
		player.phase = 0
		return 
	end

	-- Moving player
	player.position[1] = player.position[1] + player.velocity[1] * player.speed * dt
	player.position[2] = player.position[2] + player.velocity[2] * player.speed * dt
	player.phase = (player.phase + dt * 6) %4	-- Setting player phase to animate when moving
end
-- // Function for updating player


-- Function for drawing player
function player_draw()
	love.graphics.setColor(255, 255, 255, 255)	-- Setting colour to black
	-- Drawing new player quad
	love.graphics.drawq(
		player.tileset, 	-- Assigning image as tileset from player object
		love.graphics.newQuad(math.floor(player.phase) * 32, player.direction * 32 , 32, 32, 256, 128), 	-- Creating new quad
		player.position[1], 	-- Setting player position x
		player.position[2] 		-- Setting player position y
	)	
end
-- // Function for drawing player


-- Function for setting player direction, movement and collision
function player_set_direction(dir)
-- WALKING EAST
	if (dir=="E" and not check_collision(player.position[1], player.position[2], 32, 32, win_width, 0, 0, win_height)) then
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
end
-- // Function for setting player direction, movement and collision
