if(surface_exists(oEnemyDead.enemySurface))
{
	surface_set_target(oEnemyDead.enemySurface);
	
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, image_angle, c_gray, 1);
	
	surface_reset_target();
}