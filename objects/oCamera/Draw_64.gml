//Draw Cursor
if(!oGame.connected)
{
	if(_browser)
	{
		draw_sprite_ext(sCursor, 0, device_mouse_x_to_gui(0)*guiWidth, device_mouse_y_to_gui(0)*guiHeight, cursorSize, cursorSize, 0, c_white, 1);
		draw_sprite(sCursorMiddle, 0, device_mouse_x_to_gui(0)*guiWidth, device_mouse_y_to_gui(0)*guiWidth);
	}
	else
	{
		draw_sprite_ext(sCursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cursorSize, cursorSize, 0, c_white, 1);
		draw_sprite(sCursorMiddle, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	}
}