function playerWalls()
{
	image_alpha = 0;
	hsp += lengthdir_x(0.4, oGame.aimDir);
	vsp += lengthdir_y(0.4, oGame.aimDir);
	
	hsp = lerp(hsp, 0, 0.07);
	vsp = lerp(vsp, 0, 0.07);
	
	x += hsp;
	y += vsp;
	
	robPower(oGame.aimDir);
	stamina -= 0.2;
	
	//Sounds
	/*
	var sound = choose(snExplosionRubble, snExplosionRubble2, snExplosionRubble3, snExplosionRubble4, snExplosionRubble5, snExplosionRubble6);
	audio_sound_pitch(sound, random_range(0.95, 1.05));
	audio_play_sound(sound, 1, false);
	*/
	
	
	if(!tile_place_meeting(clamp(x, 0, room_width-16), clamp(y, 0, room_height-16)))
	{
		//audio_play_sound(snRob, 1, false);
		mask_index = sPlayer;
		image_alpha = 1;
		with(oGun) changeWeapon(false);
		oGun.disable = false;
		healtol = 0;
		state = PLAYER.FREE;
	}
	
	if(stamina <= 0)
	{
		causeDeath = "NO STAMINA LEFT";
		global.hp = 0;
		state = PLAYER.DEAD;
	}
}