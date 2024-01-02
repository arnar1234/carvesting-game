if(enemyShot)
{
	if(!doOnce)
	{
		doOnce = true;
		takeDamage(damage);
		
		other.deathDir = image_angle;
		other.causeDeath = "MELEE DAMAGE";
		other.downSpd = 4;
		
		other.hspKnockback = lengthdir_x(enemyKnockback, other.deathDir);
		other.vspKnockback = lengthdir_y(enemyKnockback, other.deathDir);
		
		audio_sound_pitch(sound_, random_range(0.9, 1.1));
		audio_play_sound(sound_, 1, false);
		
		//blood
		if(oPlayer.player[$ global.currentPlayer][$ "blood"] == 1)
		{
			with(other) enemyDust(other.image_angle);
			draw_blood(other.x, other.y, random_range(0.5, 0.8), random(359), 0.8);
		}
	}
}