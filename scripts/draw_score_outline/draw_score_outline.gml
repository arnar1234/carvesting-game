function draw_score_outline(_x, _y, _string, _xscale, _yscale, _color)
{
	draw_set_color(c_black);
	draw_text_transformed(_x+1, _y+1, _string, _xscale, _yscale, 0);
	draw_set_color(_color);
	draw_text_transformed(_x, _y, _string, _xscale, _yscale, 0);
}