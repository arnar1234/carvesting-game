if(surface_exists(oEnemyDead.enemySurface))
{
	surface_set_target(oEnemyDead.enemySurface);
	
	draw_sprite_ext(sprites[3], 0, x, y, 1, 1, direction, c_gray, 1);
	
	surface_reset_target();
}