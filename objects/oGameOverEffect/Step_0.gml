if(!surface_exists(gameSurface))
{
	gameSurface = surface_create(320, 180);
	surface_set_target(gameSurface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
else
{
	surface_set_target(gameSurface);
	
	//Draw black overlay
	draw_set_color(c_black);
	draw_rectangle(0, 0, 320, 180, false);
	
	//Set for the circles
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	
	//Draw the circles
	with(oPlayer) draw_sprite_ext(sprites[$ "down"], 0, x-other.cx, y-other.cy, other.radius, other.radius, image_angle+180, c_white, 1);
	
	//Reset everything
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}

radius -= 0.5;
if(radius <= 0)
{
	room_goto(rMenu);
	restartStats();
	audio_stop_all();
}