-- Function to load audio
function audio_load()
	coin_audio_data = love.sound.newSoundData("coin.wav")	-- Creating new sound data for coin
	coin_audio_source = love.audio.newSource(coin_audio_data)	-- Creating new audio source for coin
	game_music_data = love.sound.newSoundData("music.mp3")	-- Creating new sound data for game music
	game_music_source = love.audio.newSource(game_music_data)	-- Creating new audio source for game music
end
-- // Function to load audio


-- Function to play coin sound
function coin_audio_play()
	love.audio.play(coin_audio_source)	-- Playing coin sound
	love.audio.rewind(coin_audio_source)	-- Rewinding coin sound
end
-- // Function to play coin sound


-- Function to play game music
function game_music_play()
	love.audio.play(game_music_source)	-- Playing game music
end
-- // Function to play game music
