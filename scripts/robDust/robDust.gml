function robDust(angle)
{
	if(global.blood)
	{
		repeat(10) //electric
		{
			with(instance_create_depth(x, y, depth-1, oBulletDust))
			{
				sprite_index = sElectricity;
				image_angle = irandom(359);
				fric = 0.9;
				spawnStuff = false;
			
				motion_add(random(360), random_range(2, 5));
			}
		}
	}
	
	repeat(3) //Spark
	{
		with(instance_create_depth(x, y, depth-2, oFire))
		{
			sprite_index = sSpark;
			fric = 0.9;
			
			motion_add(angle+random_range(-90, 90), random_range(-3, -6));
			image_angle = direction;
		}
	}
}