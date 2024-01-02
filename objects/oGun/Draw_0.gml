if(global.weaponList[weaponCurrent] != 0 && !disable)
{
	var angleOffset = -(back*4*image_yscale);
	if(weaponType[0] == 1) angleOffset = 0;
	
	if(oPlayer.healtol <= 0)
	{
		if(lazer != 0)
		{
			draw_line_color(x+lengthdir_x(lazer*image_yscale, image_angle+90), y+lengthdir_y(lazer*image_yscale, image_angle+90), xypos[0], xypos[1], c_red, c_red);
		}

		if(muzzle != 0)
		{
			if(muzzleTime > 0) draw_sprite_ext(muzzle, muzzleIndex, x+lengthdir_x(sprite_width_, image_angle+angleOffset), y+lengthdir_y(sprite_width_, image_angle+angleOffset), 1, 1, image_angle, c_white, 0.8);
		}
	}

	if(auto == 3) && (cooldown > cooldownMax-5) gpu_set_fog(true, c_white, 0, 0);
	if(oPlayer.healtol <= 0) 
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle+angleOffset, c_white, image_alpha);
		draw_sprite_ext(handSprite, image_index, x, y, image_xscale, image_yscale, image_angle+angleOffset, handColor, image_alpha);
	}
	else
	{
		draw_sprite_ext(sPlayerHealing, (oPlayer.healtol/60)*12, x, y, oPlayer.image_xscale, 1, 0, c_white, 1);
		draw_sprite_ext(sPlayerHealingHands, (oPlayer.healtol/60)*12, x, y, oPlayer.image_xscale, 1, 0, handColor, 1);
	}
	gpu_set_fog(false, c_white, 0, 0);
}