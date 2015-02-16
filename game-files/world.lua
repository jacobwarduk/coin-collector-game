-- Loading world
function world_load()

	world_tileset = love.graphics.newImage("countryside.png")	-- Loading image tileset for drawing world
	
	-- Quads for drawing world
	world_quads = {
		love.graphics.newQuad(0, 0, 32, 32, 64, 64), 	-- Grass Quad
		love.graphics.newQuad(0, 32, 32, 32, 64, 64), 	-- Flowers Quad
		love.graphics.newQuad(32, 0, 32, 32, 64, 64), 	-- Box Quad
		love.graphics.newQuad(32, 32, 32, 32, 64, 64), 	-- Panel Quad
	}
	
	-- Creating multi-dimensional table/array to hold world map layout
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
	-- // Creating multi-dimensional array/table to hold world map layout
	
end
-- // Loading world


-- Function to draw world
function world_draw()
	for rowIndex=1, #world_map do

		local row = world_map[rowIndex]

		for columnIndex=1, #row do
			local number = row[columnIndex]
			love.graphics.drawq(world_tileset, world_quads[number], (columnIndex-1) * 32, (rowIndex-1) * 32)
	    end

	end
end
-- // Function to draw world