if(a >= 0.19)
{
	with(other)
	{	
		//Knockback
		var knockback_ = irandom_range(5, 7);
		var playerDir = point_direction(other.x, other.y, x, y);

		hsp = lengthdir_x(knockback_, playerDir);
		vsp = lengthdir_y(knockback_, playerDir);
	}
}