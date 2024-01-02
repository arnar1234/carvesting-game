function start_game(_string)
{
	global.currentPlayer = _string;
	layer_set_visible(layer_get_id("Background"), false); //Turn off cool background
			
	audio_stop_sound(snMenuMusic);
	var song = choose(0, 1, 2);
	if(song == 0) audio_play_sound(snMusic, 2, true, 1, 39);
	else if(song == 1) audio_play_sound(snMusic2, 2, true, 1, 13);
	else if(song == 2) audio_play_sound(snMusic3, 2, true, 1, 36);
	room_goto_next();
}