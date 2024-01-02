function draw_text_outline(_x, _y, _string, _color)
{
	draw_set_color(c_black);
	draw_text(_x+1, _y+1, _string);
	draw_set_color(_color);
	draw_text(_x, _y, _string);
}