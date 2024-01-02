if(surface_exists(shadowSurface))
{	
	draw_set_alpha(0.4);
	draw_surface(shadowSurface, cx, cy);
	draw_set_alpha(1);
}