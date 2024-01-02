if(other.iframe <= 0)
{
	var eDamage = damage;
	var _cooldown = cooldown_;
	var knockback_ = enemyKnockback;

	with(other)
	{
		repeat(3) //Spark
		{
			with(instance_create_depth(x, y, depth-2, oFire))
			{
				sprite_index = sSpark;
				fric = 0.9;
			
				motion_add(irandom(359), random_range(-3, -6));
				image_angle = direction;
			}
		}
		
		hp -= eDamage;
		isHit = 18;
		iframe = _cooldown;
		
		audio_sound_pitch(snBarrel, random_range(0.9, 1.1));
		audio_play_sound(snBarrel, 1, false);
		
		//play sound effect
		audio_sound_pitch(other.sound_, random_range(0.9, 1.1));
		audio_play_sound(other.sound_, 1, false);
			
		hsp += lengthdir_x(knockback_, other.image_angle);
		vsp += lengthdir_y(knockback_, other.image_angle);
	}
}