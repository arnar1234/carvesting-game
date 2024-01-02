if(a >= 0.19)
{
	if(other.state == enemy.alive)
	{
		var eDamage = 16;
		
		audio_sound_pitch(snEnemyDown, random_range(0.9, 1.1));
		
		if(audio_is_playing(snEnemyDown)) audio_stop_sound(snEnemyDown);
		audio_play_sound(snEnemyDown, 1, false);
		
		//Enemy Stuff
		with(other)
		{
			hp -= eDamage;
			isHit = 18;
		
			downSpd = 1;
		
			deathDir = point_direction(other.x, other.y, x, y)-180;

			//Knockback
			var playerDir = point_direction(other.x, other.y, x, y)-180;

			hspKnockback = lengthdir_x(-3.5, playerDir);
			vspKnockback = lengthdir_y(-3.5, playerDir);
		
			if(playerDir > 90) && (playerDir < 270) image_xscale = -1;
			else image_xscale = 1;
			
			enemyDust(deathDir);
		}
	}
}