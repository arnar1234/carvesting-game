if(other.lastbulletid != id) and (other.iframe <= 0) and (other.state == enemy.alive) and (!enemyShot)
{
	var eDamage = damage;
	var knockback_ = enemyKnockback;
		
	//Destroy bullet
	if(bulletType == 0) instance_destroy();
	else if(bulletType == 2)
	{
		createExplosion(x+lengthdir_x(16, image_angle), y+lengthdir_y(16, image_angle), true);
		instance_destroy();
	}
		
		
	//Enemy Stuff
	with(other)
	{
		hp -= eDamage;
		isHit = 18;
		iframe = 3;
		
		if(other.fireDamage_ > 0)
		{
			fire += other.fireDamage_;
					
			audio_sound_pitch(snBulletHit3, random_range(0.9, 1.1));
			audio_play_sound_at(snBulletHit3, x-oPlayer.x, y-oPlayer.y, 0, 100, 180, 0.5, 0, 1);
		}
		else
		{
			if(other.bulletType != 4) lastbulletid = other.id;
		}

		//Knockback
		deathDir = other.direction;
		hspKnockback = lengthdir_x(knockback_, deathDir);
		vspKnockback = lengthdir_y(knockback_, deathDir);
			
		var playerDir = point_direction(x, y, oPlayer.x, oPlayer.y);
		if(playerDir > 90) && (playerDir < 270) image_xscale = -1;
		else image_xscale = 1;
			
		audio_sound_pitch(snEnemyDown, random_range(0.9, 1.1));
		audio_play_sound_at(snEnemyDown, x-oPlayer.x, y-oPlayer.y, 0, 100, 180, 0.5, 0, 1);
					
		//blood
		enemyDust(other.direction);
		draw_blood(x, y, random_range(0.5, 0.8), random(359), 0.8);
	}
}