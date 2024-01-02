alarm[0] = 2;

// check if display is larger than the window
if(display_get_width() != window_get_width())
{
	// resize window to display
	window_set_size(display_get_width(),display_get_height());
	window_center();
	//gui
	display_set_gui_maximise(display_get_width() / 320, display_get_height() / 180, 0, 0);
}