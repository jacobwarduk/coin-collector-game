function score_load()
	game_score = 0	-- Default game score
	game_points = 10	-- Default points scored
end

function score_update()
	game_score = game_score + game_points	-- Updating score
end

function score_draw()
	love.graphics.printf("Score: " .. game_score, 10, win_height - 48, win_width, "left")	-- Printing score to screen
end