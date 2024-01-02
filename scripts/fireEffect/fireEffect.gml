function fireEffect()
{
	with(instance_create_depth(x, y, depth+1, oFire))
	{
		sprite_index = sFire;
		image_angle = irandom(359);
		fric = 0.8;
			
		motion_add(-90+random_range(-30, 30), random_range(-2, -4));
	}
}