if(sprite_index != -1)
{
	if(bulletType != 4)
	{
		draw_self();

		//Lighting
		set_blendmode(bm_add);
		if(bulletType != 3) draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, c_white, 0.2);
		else draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*2, image_angle, c_white, 0.2);
		set_blendmode(bm_normal);
	}
	else
	{		
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, boomerangAngle, c_white, 1);
		
		set_blendmode(bm_add);
		draw_sprite_ext(sprite_index, image_index, x, y, 2.5, 1.4, boomerangAngle, c_white, 0.2);
		set_blendmode(bm_normal);
	}
}