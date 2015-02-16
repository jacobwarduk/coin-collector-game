-- Loading misc default settings
function settings_load()
	
	gamestate = "menu"	-- Setting default gamestate to menu

	-- Font settings
	font = love.graphics.newFont("cartoon.ttf", 32)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.setColorMode("modulate")	-- Setting colour mode
	
end
-- // Loading misc default settings