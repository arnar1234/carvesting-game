if(!drawDed)
{
	if(white) gpu_set_fog(true, c_white, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x+_xx, y+_yy, image_xscale, 1, 0, c_white, 1);
	gpu_set_fog(false, c_white, 0, 0);
}
else
{
	if(white) gpu_set_fog(true, c_white, 0, 0);
	if(isHit > 0) draw_sprite_ext(sprite_index, image_index, x+_xx ,y+_yy, image_xscale, 1, 0, c_white, 1);
	else draw_sprite_ext(sprites[3], image_index, x+_xx ,y+_yy, 1, 1, direction, c_gray, 1);
	gpu_set_fog(false, c_white, 0, 0);
}