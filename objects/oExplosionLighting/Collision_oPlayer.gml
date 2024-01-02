if(a >= 0.19)
{
	with(oPlayer)
	{
		takeDamage(10);
		deathDir = point_direction(other.x, other.y, x, y);
		causeDeath = "EXPLOSION";
		downSpd = 6;
	
		hspKnockback = lengthdir_x(7.5, deathDir);
		vspKnockback = lengthdir_y(7.5, deathDir);
	}
}