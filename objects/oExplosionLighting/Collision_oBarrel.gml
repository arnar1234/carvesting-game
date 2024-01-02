if(a >= 0.19)
{
	var eDamage = 20;
	var knockback_ = irandom_range(7, 10);
	
	var knockDir = point_direction(x, y, other.x, other.y);
		
	//Enemy Stuff
	with(other)
	{
		hp -= eDamage;
		isHit = 18;
		
		explosionTimer = 40;
			
		hsp += lengthdir_x(knockback_, knockDir);
		vsp += lengthdir_y(knockback_, knockDir);
	}
}