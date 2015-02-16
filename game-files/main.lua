require("functions")	-- Including functions.lua
require("player")	-- Including player.lua
require("scoring")	-- Including scoring.lua
require("timer")	-- Including timer.lua
require("world")	-- Including world.lua
require("coins")	-- Including coins.lua
require("settings")	-- Including settings.lua
require("menu")	-- Including menu.lua
require("anim8")	-- Including anim8.lua
require("audio")	-- Including audio.lua

-- Love loader
function love.load()
	get_dimensions()	-- Calling get_dimensions function from functions.lua
	settings_load()	-- Calling settings_load function from settings.lua
	player_load()	-- Calling player_load function from player.lua
	world_load()	-- Calling world_load function from world.lua
	score_load()	-- Calling score_load function from scoring.lua
	timer_load()	-- Calling timer_load function from timer.lua
	coins_load()	-- Calling coins_load function from coins.lua
--	audio_load()	-- Calling audio_load function from audio.lua
--	game_music_play()	-- Calling game_music_play from audio.lua
end
-- // Love loader
	

-- Love update loop
function love.update(dt)
	
	if (gamestate == "play") then	-- If gamestate is play then
		player_stop()	-- Calling player_stop function from player.lua
		player_update(dt)	-- Calling player_update function from player.lua
		timer_update(dt)	-- Calling timer_update function from timer.lua
		coins_update(dt)	-- Calling coins_update function from coins.lua
	elseif (gamestate == "over") then	-- If gamestate is over then
		gameover_update()	-- Calling gameover_update from menu.lua
	elseif (gamestate == "menu") then	-- If gamestate is menu then
		menu_update()	-- Calling menu_update function from menu.lua
	elseif (gamestate == "help") then	-- If gamestate is help then
		help_update()	-- Calling help_update function from menu.lua
	elseif (gamestate == "win") then	-- If gamestate is win then
		win_update()	-- Calling win update function from menu.lua
	end
	
end
-- // Love update loop


-- Love draw loop
function love.draw()

	if (gamestate == "play") then	-- If gamestate is play then
		world_draw()	-- Calling world_draw function from world.lua
		player_draw()	-- Calling player_draw function from player.lua
		coins_draw()	-- Calling coins_draw function from coins.lua
		score_draw()	-- Calling score_draw function from scoring.lua
		timer_draw()	-- Calling timer_draw function from timer.lua
		coins_draw()	-- Calling coins_draw function from coins.lua
	elseif (gamestate == "over") then	-- If gamestate is over then
		world_draw()	-- Calling world_draw function from world.lua
		gameover_draw()	-- Calling gameover_draw function from menu.lua
	elseif (gamestate == "menu") then	-- If gamestate is menu then
		world_draw()	-- Calling world_draw function from world.lua
		menu_draw()	-- Calling menu_draw function from menu.lua
	elseif (gamestate == "help") then	-- If gamestate is help then
		world_draw()	-- Calling world_draw function from world.lua
		help_draw()	-- Calling help_draw function from menu.lua
	elseif (gamestate == "win") then	-- If gamestate is win then
		world_draw()	-- Calling world_draw function from world.lua
		win_draw()	-- Calling win_draw function from menu.lua
	end
	 
	 
end
-- // Love draw loop