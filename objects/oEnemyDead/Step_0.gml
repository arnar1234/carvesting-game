if(!surface_exists(enemySurface))
{
	enemySurface = surface_create(room_width, room_height);
	surface_set_target(enemySurface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}