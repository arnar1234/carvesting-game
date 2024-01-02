if(instance_exists(_id))
{
	eHp = _id.hp;

	//Calculating Movement
	eX = _id.x+lengthdir_x(back, image_angle);
	eY = _id.y+3+lengthdir_y(back, image_angle);

	back = max(0,abs(back)-0.8)*sign(back);
	muzzleTime = clamp(muzzleTime-1, 0, 5);
	
	eXx = _id._xx;
	eYy = _id._yy;
}

if(eHp > 0) draw = true;
else draw = false;

if(eHp > 0)
{
	x = eX+eXx;
	y = eY+eYy;
	
	//Lazer distance
	if(lazer != 0) xypos = lineDistance(x+lengthdir_x(lazer*image_yscale, image_angle+90), y+lengthdir_y(lazer*image_yscale, image_angle+90));
	
	if(weaponType[0] == 0)
	{
		image_xscale = 1;
		image_angle = shoot_angle;
	}
	else if(weaponType[0] == 1)
	{
		//Calculating Movement
		finalMeleeAngle = lerp(finalMeleeAngle, meleeAngle, 0.4);
	
		image_yscale = 1;
		image_angle = shoot_angle-finalMeleeAngle;
		
		if(sign(finalMeleeAngle) > 0) image_xscale = -1;
		else image_xscale = 1;
	}
	else if(weaponType[0] == 2)
	{
		image_xscale = 1;
		image_angle = shoot_angle;
	}
	else if(weaponType[0] == 3)
	{
		image_xscale = 1;
		image_angle = shoot_angle;
		
		if(image_index >= image_number-1)
		{
			burst = burstMax;
			alarm[2] = 1;
							
			image_index = 0;
			image_speed = 0;
		}
	}
	else if(weaponType[0] == 4)
	{
		image_xscale = 1;
		if(image_index == 0) image_angle = shoot_angle;
		else _id.input_magnitude = 0;
		
		if(image_index >= image_number-1)
		{
			burst = burstMax;
			alarm[2] = 1;
			
			image_index = 0;
			image_speed = 0;
		}
	}
	if(weaponType[0] == 5)
	{
		image_xscale = 1;
		image_angle = shoot_angle;
	}
}
else
{
	if(!doOnce)
	{
		doOnce = true;
		playerDir = point_direction(x,y,oPlayer.x,oPlayer.y);
	
		hspeed = lengthdir_x(3, playerDir-180+random_range(-30, 30));
		vspeed = lengthdir_y(3, playerDir-180+random_range(-30, 30));
		
		friction = 0.1;
		rot *= -rot;
	}
	
	if(speed > 0)
	{
		if(tile_place_meeting(x+hspeed, y+vspeed))
		{
			friction += 0.02;
			direction += 90;
		}
	}
	else a -= 0.05;
}

if(a <= 0) instance_destroy();