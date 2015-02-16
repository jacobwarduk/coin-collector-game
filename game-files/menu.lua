-- Function to draw menu
function menu_draw()
	love.graphics.setColorMode("modulate")	-- Setting colour mode
	love.graphics.setColor(0, 0, 0, 125)	-- Setting drawing colour
	love.graphics.rectangle("fill", 0, 0, 800, 600)	-- Drawing background fill

	-- Drawing menu items
	love.graphics.setColorMode("replace")	-- Setting colour mode
	love.graphics.setColor(255, 255, 255, 255)	-- Setting drawing colour
	font = love.graphics.newFont("cartoon.ttf", 64)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Main Menu", 0, 110, 800, "center")	-- Printing main menu title
	font = love.graphics.newFont("cartoon.ttf", 32)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("New Game (Enter)\nHelp (H)\nExit (Esc)", 0, 200, 800, "center")	-- Printing main menu items
end
-- // Function to draw menu


-- Function to receive and update input from user and set gamestate from main menu
function menu_update()
	if (love.keyboard.isDown("return")) then	-- If "enter" key pressed then gamestate is play
		gamestate = "play"	-- Setting gamestate to play
	elseif (love.keyboard.isDown("escape")) then	-- If "escape" key is pressed then quit game
		love.event.push("q")	-- Quiting game
	elseif (love.keyboard.isDown("h")) then	-- If "h" key is pressed then gamestate is help
		gamestate = "help"	-- Setting gamestate to help
	end
end
-- // Function to receive and update input from user and set gamestate



-- Function to draw gameover screen/menu
function gameover_draw()
	love.graphics.setColorMode("modulate")	-- Setting colour mode
	love.graphics.setColor(0, 0, 0, 125)	-- Setting drawing colour
	love.graphics.rectangle("fill", 0, 0, 800, 600)	-- Drawing background fill

	-- Drawing menu items
	love.graphics.setColorMode("replace")	-- Setting colour mode
	love.graphics.setColor(255, 255, 255, 255)	-- Setting drawing colour
	font = love.graphics.newFont("cartoon.ttf", 64)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Game Over", 0, 110, 800, "center")	-- Printing gameover title
	font = love.graphics.newFont("cartoon.ttf", 32)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Score: " .. game_score .. "\n\nNew Game (Enter)\nHelp (H)\nExit (Esc)", 0, 200, 800, "center")	-- Printing main menu items
end
-- // Function to draw gameover screen/menu


-- Function to receive and update input from user and set gamestate from gameover screen/menu
function gameover_update()
	if (love.keyboard.isDown("return")) then	-- If "enter" key pressed then reset timer and gamestate is play
		timer_load()	-- Reset timer
		coins_load()	-- Reset coins
		player_load()	-- Reset player
		score_load()	-- Reset score
		gamestate = "play"	-- Setting gamestate to play
	elseif (love.keyboard.isDown("escape")) then	-- If "escape" key is pressed then quit game
		love.event.push("q")	-- Quiting game
	elseif (love.keyboard.isDown("h")) then	-- If "h" key is pressed then gamestate is help
		gamestate = "help"	-- Setting gamestate to help
	end
end
-- // Function to receive and update input from user and set gamestate from gameover screen/menu


-- Function for drawing help screen/menu
function help_draw()
	love.graphics.setColorMode("modulate")	-- Setting colour mode
	love.graphics.setColor(0, 0, 0, 125)	-- Setting drawing colour
	love.graphics.rectangle("fill", 0, 0, 800, 600)	-- Drawing background fill

	-- Drawing menu items
	love.graphics.setColorMode("replace")	-- Setting colour mode
	love.graphics.setColor(255, 255, 255, 255)	-- Setting drawing colour
	font = love.graphics.newFont("cartoon.ttf", 64)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Help", 0, 110, 800, "center")	-- Printing gameover title
	font = love.graphics.newFont("cartoon.ttf", 32)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Try to collect as many coins as possible before the timer runs out!\n\nUp (Up Arrow)\nDown (Down Arrow)\nLeft (Left Arrow)\nRight (Right Arrow)\n\nBack To Main Menu (Enter)", 100, 200, 600, "center")	-- Printing help menu
end
-- // Function for drawing help screen/menu


-- Function to receive and update input from user and set gamestate from help screen/menu
function help_update()
	if (love.keyboard.isDown("return")) then	-- If 'enter' is pressed then
		gamestate = "menu"	-- Setting gamestate to menu
	end
end
-- // Function to receive and update input from user and set gamestate from help screen/menu



-- Function for drawing win screen/menu
function win_draw()
	love.graphics.setColorMode("modulate")	-- Setting colour mode
	love.graphics.setColor(0, 0, 0, 125)	-- Setting drawing colour
	love.graphics.rectangle("fill", 0, 0, 800, 600)	-- Drawing background fill

	-- Drawing menu items
	love.graphics.setColorMode("replace")	-- Setting colour mode
	love.graphics.setColor(255, 255, 255, 255)	-- Setting drawing colour
	font = love.graphics.newFont("cartoon.ttf", 64)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Congratulations", 0, 110, 800, "center")	-- Printing gameover title
	font = love.graphics.newFont("cartoon.ttf", 32)	-- Assigning font face and size
	love.graphics.setFont(font)	-- Setting font
	love.graphics.printf("Score: " .. game_score .. "\n\nBack To Main Menu (Enter)", 100, 200, 600, "center")	-- Printing help menu
end
-- // Function for drawing win screen/menu


-- Function to receive and update input from user and set gamestate from win screen/menu
function win_update()
	if (love.keyboard.isDown("return")) then	-- If 'enter' is pressed then
		gamestate = "menu"	-- Setting gamestate to menu
		coins_load()	-- Reloading coins in anticipation of new game
	end
end
-- // Function to receive and update input from user and set gamestate from win screen/menu
