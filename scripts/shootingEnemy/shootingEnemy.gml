function shootingEnemy()
{
	var _image_angle = other.image_angle;
	var _bulletSprite = other.bulletSprite;
	var _spd = other.spd;
	var _pattern = other.pattern;
	var _recoil = other.recoil;
	var _damage = other.damage;
	var _fireDamage = other.fireDamage;
	var _bulletType = other.bulletType;
	var _bulletTypeSettings = other.bulletTypeSettings;
	var _partType = other.particleType;
	var _dustType = other.bulletDustType;
	var _homing = other.homing;
	var _frict = other.frict;
	var _bounce = other.bounce;
	var _randomSpd = other.randomSpd;
	var _knockback = other.enemyKnockback;
	
	for(var i = 0; i < amount; i++)
	{
		with(instance_create_layer(x+lengthdir_x(bulletPos[0], image_angle+bulletPos[1]*image_yscale), y+lengthdir_y(bulletPos[0], image_angle+bulletPos[1]*image_yscale), "Bullets", oBullet))
		{
			if(_pattern == 0) direction = _image_angle + random_range(-_recoil, _recoil);
			else direction = _image_angle + ((i*_pattern) - (floor(other.amount/2))*_pattern) + random_range(-_recoil, _recoil);
			sprite_index = _bulletSprite;
			speed = _spd + random_range(0, _randomSpd);
			damage = _damage;
			fireDamage_ = _fireDamage;
			bulletType = _bulletType;
			bulletTypeSettings = _bulletTypeSettings;
			partType = _partType;
			bulletDustType_ = _dustType;
			homing = _homing;
			frict = _frict;
			bounce = _bounce;
			enemyKnockback = _knockback;
			image_angle = direction;
			
			enemyShot = true;
			
			//Make sure player can also die from explosions
			if(bulletType == 2) alarm[1] = 5;
			if(bulletType == 4)
			{
				returnSpd = -speed;
				boomerangAdd = bulletTypeSettings[1]*other.image_yscale;
				enemyId = other.id;
			}
		}
	}
	
	if(shell[2] != 0) alarm[9] = shell[2];
	
	_id.hspKnockback = lengthdir_x(pushback, image_angle-180);
	_id.vspKnockback = lengthdir_y(pushback, image_angle-180);
			
	back = -backMax;
	muzzleTime = 3;
	muzzleIndex = irandom_range(0, 4);
			
	audio_sound_pitch(sound, random_range(0.95, 1.05));
	audio_play_sound_at(sound, x-oPlayer.x, y-oPlayer.y, 0, 140, 180, 0.5, 0, 1, 0.5);
}