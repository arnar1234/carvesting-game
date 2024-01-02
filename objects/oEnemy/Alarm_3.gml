/// @description Fire damage
alarm[3] = 30;

if(state == enemy.alive)
{
	if(fire > 0)
	{
		fire -= 1;
	
		hp -= 2;
		isHit = 18;
		
		audio_sound_pitch(snBulletHit3, random_range(0.9, 1.1));
		audio_play_sound_at(snBulletHit3, x-oPlayer.x, y-oPlayer.y, 0, 10, 180, 0.3, 0, 1);
		
		//blood
		enemyDust(irandom(359));
		draw_blood(x, y, random_range(0.5, 0.8), irandom(359), 0.8);
	}
}