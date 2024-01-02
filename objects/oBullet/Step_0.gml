//Collisions
if(bounce != false)
{
	if(bulletType == 2)
	{
		if(speed <= 0)
		{
			createExplosion(x, y);
			instance_destroy();
		}
	}
	
	if(bulletType == 4)
	{
		if(speed > 0) bulletTileCollision(bounce);
	}
	else
	{
		bulletTileCollision(bounce);
		image_angle = point_direction(x, y, x+hspeed, y+vspeed);
	}
}
else
{
	if(tilemap_get_at_pixel(wall_map_id, x+lengthdir_x(sprite_width, image_angle), y+lengthdir_y(sprite_width, image_angle)))
	{
		if(bulletType == 0 or bulletType == 1)
		{
			instance_destroy();
			bulletDust();
		}
		if(bulletType == 2)
		{
			instance_destroy();
			createExplosion(x+lengthdir_x(16, image_angle), y+lengthdir_y(16, image_angle), true);
		}
	}
}

//Friction
if(frict == 0) image_speed = 0;
else friction += frict;

//Animation
if(partType[0] != 0)
{
	if(partType[1] == false) with(instance_create_depth(x+random_range(-2, 2), y+random_range(-2, 2), depth+1, oDust))
	{
		sprite_index = other.partType[0];
		spd = other.partType[2];
	}
	else with(instance_create_depth(x, y, depth+1, oDust))
	{
		image_angle = other.image_angle;
		sprite_index = other.partType[0];
		spd = other.partType[2];
	}
}

//Lazer
if(bulletType == 3)
{
	while(!tilemap_get_at_pixel(wall_map_id, x+lengthdir_x(image_xscale, image_angle), y+lengthdir_y(image_xscale, image_angle)))
	{
		image_xscale += 1;
	}
	
	image_yscale -= 0.1;
	if(image_yscale <= 0) instance_destroy();
}

//Homing Stuff
if(instance_exists(oGun))
{
	if(homing[0] == 1)
	{
		var _dir = point_direction(x, y, oGun.homing_xypos[0], oGun.homing_xypos[1]);
		if(enemyShot) _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	
		var _diff = angle_difference(_dir, direction);
		direction += _diff * homing[1];
	
		direction = direction;
		image_angle = direction;
	}
}

//Boomerang
if(bulletType == 4)
{
	boomerangAngle += boomerangAdd;
	
	var goBackObj = oPlayer;
	if(enemyShot) goBackObj = enemyId;
	
	image_angle = point_direction(goBackObj.x, goBackObj.y, x, y);
	speed = lerp(speed, returnSpd*2, bulletTypeSettings[2]);
	if(speed < 0)
	{
		direction = point_direction(x, y, goBackObj.x, goBackObj.y)-180;
		if(instance_place(x, y, goBackObj)) instance_destroy();
	}
}

//Clamp speed
if(frict < 0) speed = clamp(speed, -15, 15);