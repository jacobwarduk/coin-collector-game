function timer_load()
	game_time = 40	-- Setting starting game time
end

function timer_update(dt)
	
	game_time = string.format("%.2f", game_time - dt)	-- Updating time remaining
		
	game_time_num = tonumber(game_time)	-- Parsing game time string to number
	
	-- If game time is less than zero then gamestate is over
	if (game_time_num <= 0) then
		gamestate = "over"
	end
	
end

function timer_draw()
	love.graphics.printf("Time: " .. game_time, 600, win_height - 48, 800, "left")	-- Drawing timer to screen
end