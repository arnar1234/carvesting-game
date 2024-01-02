function melee()
{
	var _bulletSprite = other.bulletSprite;
	var _damage = other.damage;
	var _spd = other.spd;
	var _sound = other.sound;
	var _knockback = other.recoil;
	var _knockback = other.enemyKnockback;
	var _bounce = other.bounce;
	
	var dir = oGame.aimDir;
	
	if(burstRate != 1) var _cooldown = other.burstRate;
	else var _cooldown = other.cooldown;
	
	repeat(amount)
	{
		with(instance_create_layer(x, y, "Bullets", oMelee))
		{
			direction = dir;
			sprite_index = _bulletSprite;
			speed = _spd;
			damage = _damage;
			sound_ = _sound;
			cooldown_ = _cooldown;
			enemyKnockback = _knockback;
			bounce = _bounce;
			image_angle = direction;
		}
	}
			
	screenShake(screen_shake, screen_shake);
	oCamera.cursorSize = 1.3;
			
	oPlayer.hspKnockback = lengthdir_x(pushback, dir);
	oPlayer.vspKnockback = lengthdir_y(pushback, dir);
	back = -backMax*image_xscale;
	
	audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
	audio_play_sound(weaponType[1], 1, false);
	
	if(bulletType == 2)
	{
		//Destroy Tiles
		for(_x = -1; _x < 2; _x++)
		{
			for(_y = -1; _y < 2; _y++)
			{
				var xx = _x*16;
				var yy = _y*16;
				
				destroyTiles(x+xx, y+yy, false);
			}
		}
	}
}