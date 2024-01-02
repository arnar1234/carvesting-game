if(isHit <= 0)
{
	if(enemyType != 1) _input_direction = irandom(359);
	else
	{
		if(distance_to_object(oPlayer) < 100) && (global.hp > 0) _input_direction = point_direction(x, y, oPlayer.x, oPlayer.y)+irandom_range(-20, 20);
		else _input_direction = irandom(359);
	}
	input_magnitude = choose(0.4, 0.5 , 0.6);
}

alarm[1] = irandom_range(walkingStop[0], walkingStop[1]);