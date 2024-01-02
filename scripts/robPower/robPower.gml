function robPower(angle)
{
	repeat(6) //electric
	{
		with(instance_create_depth(x, y, 500, oFire))
		{
			sprite_index = sElectricity2;
			image_angle = irandom(359);
			fric = 0.9;
			
			motion_add(irandom(359), random_range(1, 1.7));
		}
	}
}