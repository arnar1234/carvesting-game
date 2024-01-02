function createExplosion(xx, yy, instant = false)
{
	if(!instant)
	{
		//Spawn
		instance_create_layer(xx, yy, "EnemyDown", oExplosionInit);
	}
	else
	{
		//Bloom
		oPlayer.vigentteA = 1;

		//Sound effecy
		if(audio_is_playing(snExplosion)) audio_stop_sound(snExplosion);
		audio_sound_pitch(snExplosion, random_range(0.8, 1.2));
		audio_play_sound_at(snExplosion, xx-oPlayer.x, yy-oPlayer.y, 0, 140, 180, 0.5, 0, 1);

		//lighitng
		instance_create_layer(xx, yy, "Bullets", oExplosionLighting);
	
		//Create Explosion
		maxAmount = irandom_range(8, 12);
		for(c = 0; c < maxAmount; c++)
		{
			explosionDir = (c * 360/maxAmount) + irandom_range(-45, 45);
			with(instance_create_layer(xx+random_range(-10, 10), yy+random_range(-10, 10), "Bullets", oExplosion1))
			{
				direction = other.explosionDir;
			}
		}
		
		maxAmount = irandom_range(20, 30);
		for(c = 0; c < maxAmount; c++)
		{
			explosionDir = (c * 360/maxAmount) + irandom_range(-10, 10);
			var explosionLength = irandom_range(10, 20);
			with(instance_create_layer(xx+lengthdir_x(explosionLength, explosionDir), yy+lengthdir_y(explosionLength, explosionDir), "Bullets", oExplosion2))
			{
				direction = other.explosionDir;
			}
		}
	}
}