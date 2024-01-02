if(pause)
{	
	//Gui
	guiWidth_ = oCamera.guiWidth;
	guiHeight_ = oCamera.guiHeight;
	
	var mouse_x_gui = device_mouse_x_to_gui(0)*guiWidth_;
	var mouse_y_gui = device_mouse_y_to_gui(0)*guiHeight_;
	
	//Calculate box
	var guiSpd = 0.2;
	menu_left_gui = lerp(menu_left_gui, menu_left-10, guiSpd);
	menu_right_gui = lerp(menu_right_gui, menu_right+10, guiSpd);
	menu_y_gui = lerp(menu_y_gui, menu_y, guiSpd);
	menu_top_gui = lerp(menu_top_gui, menu_top+6, guiSpd);
	
	if(!oGame.connected)
	{
		//Mouse movement
		if(mouse_y_gui > menu_y+5) && (mouse_y_gui < menu_top) && (mouse_x_gui > menu_left) && (mouse_x_gui < menu_right)
		{
			menuPointer = ((mouse_y_gui-(4+length)) - menu_y) div (gap);
			if(menuPointer != oldMenuPointer) audio_play_sound(snMenuMove, 1, false);
			oldMenuPointer = menuPointer;
		}
		else
		{
			if(menuPointer != oldMenuPointer) audio_play_sound(snMenuMove, 1, false);
			oldMenuPointer = menuPointer;
			menuPointer = -1;
		}
		
		//Slider Stuff
		if(menuPointer >= 0 and menuPointer < length) and (canSlide)
		{
			if(is_array(currentMenu[menuPointer]))
			{
				if(mouse_check_button(mb_left))
				{
					var sliderOffset = (menu_x+string_length(currentMenu[menuPointer][0])*4)/86;
					currentMenu[menuPointer][1] = clamp(round_ext((mouse_x_gui/86)-sliderOffset, 0.05), 0, 1);
				
					if(currentMenu[menuPointer][1] != currentMenuLastSlider) audio_play_sound(snMenuMove, 1, false, , , currentMenu[menuPointer][1]);
					currentMenuLastSlider = currentMenu[menuPointer][1];
				
					if(currentMenu == audio)
					{
						audio_group_set_gain(agSfx, global.masterPercent, 0);
						audio_group_set_gain(audiogroup_default, global.musicPercent, 0);
					}
				}
			}
		}
	}
	else
	{
		//Controller plater that is a controller player
		if(menuPointer <= -1) menuPointer = length-1;
		else if(menuPointer >= length) menuPointer = 0;
	
		if(oGame.menuUp)
		{
			audio_play_sound(snMenuMove, 1, false);
			menuPointer -= 1;
		}
		else if(oGame.menuDown)
		{
			audio_play_sound(snMenuMove, 1, false);
			menuPointer += 1;
		}
		
		//Slider Stuff
		if(menuPointer >= 0 and menuPointer < length)
		{
			if(is_array(currentMenu[menuPointer]))
			{
				if(oGame.menuHorizontal != 0) and (oGame.horiMag > 0.5)
				{
					fakeValue = clamp(fakeValue + (oGame.menuHorizontal/100)*oGame.mag, 0, 1);
				
					currentMenu[menuPointer][1] = round_ext(fakeValue, 0.05);
				
					if(currentMenu[menuPointer][1] != currentMenuLastSlider) audio_play_sound(snMenuMove, 1, false, , , currentMenu[menuPointer][1]);
					currentMenuLastSlider = currentMenu[menuPointer][1];
				
					//change audio settings
					if(currentMenu == audio)
					{
						audio_group_set_gain(agSfx, global.masterPercent, 0);
						audio_group_set_gain(audiogroup_default, global.musicPercent, 0);
					}
				}
				else fakeValue = currentMenu[menuPointer][1];
			}
		}
	}

	//Escape
	if(oGame.menuBack) or (oGame.menuPause)
	{
		if(currentMenu != menu)
		{
			alarm[0] = 1;
			length = 0;
			currentMenu = lastMenu;
			
			audio_play_sound(snMenuBack, 1, false);
		}
		else
		{
			audio_play_sound(snMenuClick, 1, false);
			
			pause = false;
			instance_activate_all();
			if(surface_exists(pauseSurf)) surface_free(pauseSurf);
			if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		}
	}
	

	//Mouse Pressed
	if(oGame.menuAccept)
	{
		if(menuPointer != -1)
		{
			alarm[0] = 1;
			audio_play_sound(snMenuClick, 1, false);
		}
	
		//Menu system
		if(currentMenu == menu)
		{
			switch(menuPointer)
			{
				case 0: //Resume
					pause = false;
					instance_activate_all();
					if(surface_exists(pauseSurf)) surface_free(pauseSurf);
					if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
				break;
		
				case 1: //Settings
					length = 0;
					currentMenu = settings;
				break;
		
				case 2: //Main menu
					audio_stop_all();
					restartStats();
					room_goto(rMenu);
				break;
			}
		}
		else if(currentMenu == settings)
		{
			switch(menuPointer)
			{
				case 0: //Video
					length = 0;
					currentMenu = video;
				break;
		
				case 1: //Audio
					length = 0;
					currentMenu = audio;
				break;
				
				case 2: //Controller
					length = 0;
					currentMenu = controls;
				break;
			}
		}
		else if(currentMenu == video)
		{
			switch(menuPointer)
			{
				case 0: //Fullscreen
					if(video[0] == "FULLSCREEN: OFF") window_set_fullscreen(true);
					else window_set_fullscreen(false);
				break;
				
				case 2: //Blood
					if(!global.blood) global.blood = true;
					else
					{
						if(surface_exists(oEnemyDead.enemySurface)) surface_free(oEnemyDead.enemySurface);
						global.blood = false;
					}
				break;
				
				case 3: //Weather
					if(!global.weatherSettings) global.weatherSettings = true;
					else global.weatherSettings = false;
				break;
				
				case 4: //Bloom
					if(!global.bloom) global.bloom = true;
					else global.bloom = false;
				break;
			}
		}
		else if(currentMenu == controls)
		{
			switch(menuPointer)
			{
				case 1: //Layout
					if(global.controllerLayout == 1) global.controllerLayout = 2;
					else global.controllerLayout = 1;
				break;
			}
		}
	}


	//Save last menu
	if(currentMenu == menu) lastMenu = menu;
	else if(currentMenu == settings) lastMenu = menu;
	else if(currentMenu == video) lastMenu = settings;
	else if(currentMenu == audio) lastMenu = settings;
	else if(currentMenu == controls) lastMenu = settings;

	//check if game is fullscreened
	if(window_get_fullscreen()) video[0] = "FULLSCREEN: ON";
	else video[0] = "FULLSCREEN: OFF";
	
	//check if game has blood on
	if(global.blood) video[2] = "BLOOD: ON";
	else video[2] = "BLOOD: OFF";
	
	//what layout
	if(global.controllerLayout == 1) controls[1] = "LAYOUT: 1";
	else controls[1] = "LAYOUT: 2";
	
	//check if game has weather on
	if(global.weatherSettings) video[3] = "WEATHER: ON";
	else video[3] = "WEATHER: OFF";
	
	//check if game has bloom on
	if(global.bloom) video[4] = "BLOOM: ON";
	else video[4] = "BLOOM: OFF";
	
	//Update slider values
	if(currentMenu == video) global.screenShakePercent = currentMenu[1][1];
	if(currentMenu == audio) global.masterPercent = currentMenu[0][1];
	if(currentMenu == audio) global.musicPercent = currentMenu[1][1];
	if(currentMenu == controls) global.vibrationPercent = currentMenu[0][1];

	if(mouse_check_button_released(mb_left)) canSlide = true;

	//position calculations
	if(currentMenu != currentMenuLast)
	{
		canSlide = false;
		
		if(array_length(currentMenu) = 1) menu_y = 85;
		else if(array_length(currentMenu) = 2) menu_y = 70;
		else if(array_length(currentMenu) = 3) menu_y = 57;
		else if(array_length(currentMenu) = 4) menu_y = 45;
		else if(array_length(currentMenu) = 5) menu_y = 32;
		
		menu_top = menu_y + 5 + (gap * array_length(currentMenu));
		menu_largest_string = largest_string_in_array_pause(currentMenu);
		menu_left = menu_x-(menu_largest_string*gapX);
		menu_right = menu_x+(menu_largest_string*gapX);
	}
	currentMenuLast = currentMenu;
}
else
{
	if (r == 10) { r = 0; render(); }
	else r ++;
	
	if(oGame.menuPause) && (global.hp > 0) //Toggle pause
	{
		guiWidth_ = oCamera.guiWidth;
		guiHeight_ = oCamera.guiHeight;
		
		//The black rectangle
		menu_left_gui = menu_left+40;
		menu_right_gui = menu_right-40;
		menu_y_gui = menu_y+40;
		menu_top_gui = menu_top-40;
		
		currentMenu = menu;
		menuPointer = -1;
		length = 0;
		alarm[0] = 1;
		audio_play_sound(snMenuBack, 1, false);
		
		pause = true;
		
		//Deactivate everything
		instance_deactivate_all(true);
		instance_activate_object(oRandomGeneration);
		instance_activate_object(oEnemyDead);
		instance_activate_object(oGame);
		instance_activate_object(oCamera);
		
		//Capture screen shot of game
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
			draw_clear_alpha(c_black, 0);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		//Back up this surface into surface just in case it gets lost n stuff
		if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
}