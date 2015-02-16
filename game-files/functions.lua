-- Function to detect collisions - check_collision (x_coordinates, y_coordinates, width, height, x_coordinates, y_coordinates, width, height)
function check_collision(x1, y1, w1, h1, x2, y2, w2, h2)
	
	-- If x position of object one is greater than x position or width of object two or x position plus width of object one is less than object two then no collision
	if x1 > (x2 + w2) or (x1 + w1) < x2 then
		return false	-- Returning false
	
	-- If y position of object one is greater than y position or height of object two or y position plus height of object one is less than object two then no collision
	elseif y1 > (y2 + h2) or (y1 + h1) < y2 then
		return false	-- Returning false
	else
		return true	-- Collision - Returning true
	end
end
-- // Function to detect collisions


-- Function to get window dimensions
function get_dimensions()
	win_width = love.graphics.getWidth()	-- Getting window width and assigning to variable
	win_height = love.graphics.getHeight()	-- Getting window height and assigning to variable
end
-- // Function to get window dimensions


