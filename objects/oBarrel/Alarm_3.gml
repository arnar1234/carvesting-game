/// @description Fire damage
alarm[3] = 30;

if(hp > 0)
{
	if(fire > 0)
	{
		fire -= 1;
	
		hp -= 4;
		isHit = 18;
		
		audio_sound_pitch(snBulletHit3, random_range(0.9, 1.1));
		audio_play_sound_at(snBulletHit3, x-oPlayer.x, y-oPlayer.y, 0, 10, 180, 0.3, 0, 1);
	}
}