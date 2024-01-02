if(pause)
{
	draw_sprite_ext(sPixel, 0, 0, 0, 320, 180, 0, c_black, 0.5);
	
	//Draw box that everything in the menu is in
	draw_sprite_stretched_ext(sBox, 0, menu_left_gui, menu_y_gui, menu_right_gui-menu_left_gui, menu_top_gui-menu_y_gui, c_white, 0.5);
	
	
	//change starting point
	draw_set_halign(fa_center);

	//Draw Title
	draw_set_color(c_white);
	draw_set_font(fnFont);
	if(currentMenu == menu) draw_text_outline(menu_x, 4, "PAUSED", c_white);
	else if(currentMenu == settings) draw_text_outline(menu_x, 4, "SETTINGS", c_white);
	else if(currentMenu == video) draw_text_outline(menu_x, 4, "VIDEO", c_white);
	else if(currentMenu == audio) draw_text_outline(menu_x, 4, "AUDIO", c_white);
	else if(currentMenu == controls) draw_text_outline(menu_x, 4, "CONTROLLER", c_white);
	
	//Draw Menu
	draw_set_font(fnFontMenu);

	for(var i = 0; i < length; i++)
	{	
		if(i == menuPointer)
		{
			if(is_array(currentMenu[i])) 
			{
				draw_text_outline(menu_x-string_length(currentMenu[i][0])*4, (menu_y+i*gap)-2+(length), currentMenu[i][0], c_white);
				draw_sprite(sSliderBackground, 0, menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)-2+(length)+7);
				draw_sprite_ext(sSliderColor, 0, 2+menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)-2+(length)+9, currentMenu[i][1]*86, 1, 0, c_white, 1);
				draw_sprite(sSlider, 0, round((-3+menu_x+string_length(currentMenu[i][0])*4)+currentMenu[i][1]*86), (menu_y+i*gap)-2+(length)+6);
			
				draw_set_font(fnFont);
				draw_set_halign(fa_left);
				draw_text_outline(3+menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)-2+(length)+7, string(round(currentMenu[i][1]*100))+"%", c_white);
				draw_set_font(fnFontMenu);
				draw_set_halign(fa_center);
			}
			else draw_text_outline(menu_x, (menu_y+i*gap)-2+(length), currentMenu[i], c_white);
		}
		else
		{
			if(is_array(currentMenu[i]))
			{
				draw_text_outline(menu_x-string_length(currentMenu[i][0])*4, menu_y+i*gap+(length), currentMenu[i][0], c_gray);
				draw_sprite_ext(sSliderBackground, 0, menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)+(length)+7, 1, 1, 0, c_ltgray, 1);
				draw_sprite_ext(sSliderColor, 0, 2+menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)+(length)+9, currentMenu[i][1]*86, 1, 0, c_ltgray, 1);
				draw_sprite_ext(sSlider, 0, round((-3+menu_x+string_length(currentMenu[i][0])*4)+currentMenu[i][1]*86), (menu_y+i*gap)+(length)+6, 1, 1, 0, c_ltgray, 1);
			
				draw_set_font(fnFont);
				draw_set_halign(fa_left);
				draw_text_outline(3+menu_x+string_length(currentMenu[i][0])*4, (menu_y+i*gap)+(length)+7, string(round(currentMenu[i][1]*100))+"%", c_ltgray);
				draw_set_font(fnFontMenu);
				draw_set_halign(fa_center);
			}
			else draw_text_outline(menu_x, menu_y+i*gap+(length), currentMenu[i], c_gray);
		}
	}

	//reset halign and valign
	draw_set_halign(fa_left);
	
	//Draw Cursor
	if(!oGame.connected)
	{
		draw_sprite(sCursor, 0, device_mouse_x_to_gui(0)*guiWidth_, device_mouse_y_to_gui(0)*guiHeight_);
		draw_sprite(sCursorMiddle, 0, device_mouse_x_to_gui(0)*guiWidth_, device_mouse_y_to_gui(0)*guiHeight_);
	}
}