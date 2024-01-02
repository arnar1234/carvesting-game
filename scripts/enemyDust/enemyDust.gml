function enemyDust(angle)
{
	if(global.blood)
	{
		repeat(6) //blood
		{
			with(instance_create_depth(x, y, depth-1, oBulletDust))
			{
				sprite_index = sBloodDust;
				image_angle = irandom(359);
				fric = 0.9;
				spawnStuff = true;
			
				motion_add(angle+random_range(-40, 40), random_range(5, 8));
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