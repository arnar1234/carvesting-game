function draw_blood(xx, yy, _scale, _angle, _alpha)
{
	if(global.blood)
	{
		if(surface_exists(oEnemyDead.enemySurface))
		{
			surface_set_target(oEnemyDead.enemySurface);
			draw_sprite_ext(sBlood, 0, xx, yy, _scale, _scale, _angle, c_white, _alpha);
			surface_reset_target();
		}
	}
}