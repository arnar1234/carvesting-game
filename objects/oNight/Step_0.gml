if(!surface_exists(nightSurface))
{
	nightSurface = surface_create(320+offsetX, 180+offsetY);
	surface_set_target(nightSurface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
else
{
	surface_set_target(nightSurface);
	
	//Draw black overlay
	draw_set_color(c_black);
	draw_rectangle(-offsetHalfX, -offsetHalfY, 320+offsetHalfX, 180+offsetHalfY, false);
	
	//Set for the circles
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	
	//Draw the circles
	with(oPlayer) draw_circle(x+random_range(-1, 1)-other.cx, y+random_range(-1, 1)-other.cy, 120, false);
	with(oExplosionLighting) draw_circle(x-other.cx, y-other.cy, 120, false);
	
	//Reset everything
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}


if(!surface_exists(nightSurface2))
{
	nightSurface2 = surface_create(320+offsetX, 180+offsetY);
	surface_set_target(nightSurface2);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
else
{
	surface_set_target(nightSurface2);
	
	//Draw black overlay
	draw_set_color(c_black);
	draw_rectangle(-offsetHalfX, -offsetHalfY, 320+offsetHalfX, 180+offsetHalfY, false);
	
	//Set for the circles
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	
	//Draw the circles
	with(oPlayer) if(global.hp > 0) draw_sprite_ext(sCone, 0, x+lengthdir_x(5, oGame.aimDir)-other.cx, y+lengthdir_y(5,oGame.aimDir)-other.cy, 1, 1, oGame.aimDir, c_white, 1);
	with(oExplosionLighting) draw_circle(x-other.cx, y-other.cy, 85, false);
	
	//Reset everything
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}