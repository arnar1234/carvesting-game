if(spawnStuff)
{
	alarm[0] = 3;
	
	if(surface_exists(oEnemyDead.enemySurface))
	{
		surface_set_target(oEnemyDead.enemySurface);
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, 0.8);
		surface_reset_target();
	}
}