//Sound effecy
if(audio_is_playing(snExplosion)) audio_stop_sound(snExplosion);
audio_sound_pitch(snExplosion, random_range(0.8, 1.2));
audio_play_sound_at(snExplosion, x-oPlayer.x, y-oPlayer.y, 0, 140, 180, 0.5, 0, 1);

depth = 730;