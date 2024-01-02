if(other.lastbulletid != id) and (other.iframe <= 0)
{
	var eDamage = damage;
	var knockback_ = enemyKnockback;
		
	//Destroy bullet
	if(bulletType == 0) instance_destroy();
	else if(bulletType == 2)
	{
		createExplosion(x, y, true);
		instance_destroy();
	}
		
	//Enemy Stuff
	with(other)
	{
		repeat(3) //Spark
		{
			with(instance_create_depth(x, y, depth-2, oFire))
			{
				sprite_index = sSpark;
				fric = 0.9;
			
				motion_add(irandom(359)+random_range(-90, 90), random_range(-3, -6));
				image_angle = direction;
			}
		}

		hp -= eDamage;
		isHit = 18;
		iframe = 3;
				
		if(other.fireDamage_ > 0)
		{
			fire += other.fireDamage_;
			hp -= 2;
					
			audio_sound_pitch(snBulletHit3, random_range(0.9, 1.1));
			audio_play_sound_at(snBulletHit3, x-oPlayer.x, y-oPlayer.y, 0, 100, 180, 0.5, 0, 1);
		}
		else
		{
			if(other.bulletType != 4) lastbulletid = other.id;
		}
		
		var deathDir = other.direction;
		hsp += lengthdir_x(knockback_*0.833, deathDir);
		vsp += lengthdir_y(knockback_*0.833, deathDir);
			
		audio_sound_pitch(snBarrel, random_range(0.9, 1.1));
		audio_play_sound_at(snBarrel, x-oPlayer.x, y-oPlayer.y, 0, 100, 180, 0.5, 0, 1);
	}
}