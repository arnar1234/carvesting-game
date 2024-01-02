if(other.state == enemy.alive) && (!enemyShot)
{
	if(other.iframe <= 0)
	{
		var eDamage = damage;
		var _cooldown = cooldown_;
		var knockback_ = enemyKnockback;

		with(other)
		{
			hp -= eDamage;
			isHit = 18;
			iframe = _cooldown;
			
			downSpd = 0.5;
			deathDir = other.image_angle;

			//Knockback
			hspKnockback = lengthdir_x(knockback_, deathDir);
			vspKnockback = lengthdir_y(knockback_, deathDir);
		
			//Face player when hit
			var playerDir = point_direction(x, y, mouse_x, mouse_y);
			if(playerDir > 90) && (playerDir < 270) image_xscale = -1;
			else image_xscale = 1;
		
			//play sound effect
			audio_sound_pitch(snEnemyDown, random_range(0.9, 1.1));
			audio_play_sound(snEnemyDown, 1, false);
		
			audio_sound_pitch(other.sound_, random_range(0.9, 1.1));
			audio_play_sound(other.sound_, 1, false);
		}
	}
	
	//blood
	with(other) enemyDust(other.image_angle);
	draw_blood(other.x, other.y, random_range(0.5, 0.8), random(359), 0.8);
}