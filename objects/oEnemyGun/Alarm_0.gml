if(eHp > 0)
{
	alarm[0] = 3;

	 var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	_diff = angle_difference(_dir, image_angle);
		
	if(weaponType[0] != 1)
	{
		if(_dir > 90) && (_dir < 270) image_yscale = -1;
		else image_yscale = 1;
		
		if(weaponType[0] != 4) shoot_angle += _diff * 0.25;
		else
		{
			if(image_index == 0) shoot_angle += _diff * 0.25;
		}
	}
	else shoot_angle = _dir;
}