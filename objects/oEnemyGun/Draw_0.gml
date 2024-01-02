if(draw)
{
	var angleOffset = -(back*4*image_yscale);
	
	if(lazer != 0)
	{
		draw_line_color(x+lengthdir_x(lazer*image_yscale, image_angle+90), y+lengthdir_y(lazer*image_yscale, image_angle+90), xypos[0], xypos[1], c_red, c_red);
	}

	if(muzzle != 0)
	{
		if(muzzleTime > 0) draw_sprite_ext(muzzle, muzzleIndex, x+lengthdir_x(sprite_width_, image_angle+angleOffset), y+lengthdir_y(sprite_width_, image_angle+angleOffset), 1, 1, image_angle, c_white, 0.8);
	}

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle+angleOffset, c_white, image_alpha);
}
else draw_sprite_ext(gunSprite, image_index, x, y, 1, 1, speed*rot*130, c_gray, a);