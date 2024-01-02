function bulletDust()
{
	if(bulletDustType_ == 0)
	{
		repeat(6) //Dust
		{
			with(instance_create_layer(x, y, "BulletDust", oBulletDust))
			{
				image_angle = irandom(359);
				fric = 0.8;
			
				motion_add(other.image_angle+random_range(-70, 70), random_range(-3, -6));
			}
		}
	
		repeat(3) //Spark
		{
			with(instance_create_depth(x+lengthdir_x(5, image_angle), y+lengthdir_y(5, image_angle), depth-2, oFire))
			{
				sprite_index = sSpark;
				fric = 0.9;
			
				motion_add(other.image_angle+random_range(-90, 90), random_range(-3, -6));
				image_angle = direction;
			}
		}
	}
	else
	{
		if(surface_exists(oEnemyDead.enemySurface))
		{
			surface_set_target(oEnemyDead.enemySurface);
			draw_sprite_ext(sprite_index, 0, x+lengthdir_x(15, image_angle), y+lengthdir_y(15, image_angle), 0.8, 0.8, image_angle, c_white, 1);
			surface_reset_target();
		}
	}
	
	if(surface_exists(oEnemyDead.enemySurface))
	{
		repeat(3)
		{
			surface_set_target(oEnemyDead.enemySurface);
			draw_sprite_ext(sPebble, 4, x+irandom_range(-6, 6), y+irandom_range(-6, 6), random_range(0.25, 0.5), random_range(0.25, 0.5), irandom(359), c_white, 0.8);
			surface_reset_target();
		}
	}
}