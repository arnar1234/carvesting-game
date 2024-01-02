//Calculate box
var guiSpd = 0.2;
menu_left_gui = lerp(menu_left_gui, menu_left-10, guiSpd);
menu_right_gui = lerp(menu_right_gui, menu_right+10, guiSpd);
menu_y_gui = lerp(menu_y_gui, menu_y, guiSpd);
menu_top_gui = lerp(menu_top_gui, menu_top+6, guiSpd);
var menuReal = menu[$ currentMenu];

if(!oGame.connected)
{
	//Mouse movement
	if(mouse_y > menu_y+5) && (mouse_y < menu_top) && (mouse_x > menu_left) && (mouse_x < menu_right)
	{
		menuPointer = ((mouse_y-(4+length)) - menu_y) div (gap);
		if(menuPointer != oldMenuPointer) { audio_play_sound(snMenuMove, 1, false); characterXLerp = 230; }
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
		if(menuReal[$ "info"][menuPointer][0] == "SLIDER")
		{
			if(mouse_check_button(mb_left))
			{
				var sliderOffset = (menu_x+((string_length(menuReal[$ "info"][menuPointer][1] + ": ")*16)-6))/86;
				if(menuReal[$ "positions"][2] == fa_center) sliderOffset = (menu_x+((string_length(menuReal[$ "info"][menuPointer][1] + ": ")*7)-45))/86;
				else if(menuReal[$ "positions"][2] == fa_right) sliderOffset = (menu_x-((string_length(menuReal[$ "info"][menuPointer][1] + ": ")*16)+90))/86;
				menuReal[$ "info"][menuPointer][2] = clamp(round_ext((mouse_x/86)-sliderOffset, 0.05), 0, 1);
				
				if(menuReal[$ "info"][menuPointer][2] != currentMenuLastSlider) audio_play_sound(snMenuMove, 1, false, , , menuReal[$ "info"][menuPointer][2]);
				currentMenuLastSlider = menuReal[$ "info"][menuPointer][2];
				menuReal[$ "info"][menuPointer][3](menuReal[$ "info"][menuPointer][2]); //send to varible
				
				if(currentMenu == "audio")
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
		if(menuReal[$ "info"][menuPointer][0] == "SLIDER")
		{
			if(oGame.menuHorizontal != 0) and (oGame.horiMag > 0.5)
			{
				fakeValue = clamp(fakeValue + (oGame.menuHorizontal/100)*oGame.mag, 0, 1);
				menuReal[$ "info"][menuPointer][2] = round_ext(fakeValue, 0.05);
				
				if(menuReal[$ "info"][menuPointer][2] != currentMenuLastSlider) audio_play_sound(snMenuMove, 1, false, , , menuReal[$ "info"][menuPointer][2]);
				currentMenuLastSlider = menuReal[$ "info"][menuPointer][2];
				menuReal[$ "info"][menuPointer][3](menuReal[$ "info"][menuPointer][2]); //send to varible
				
				//change audio settings
				if(currentMenu == "audio")
				{
					audio_group_set_gain(agSfx, global.masterPercent, 0);
					audio_group_set_gain(audiogroup_default, global.musicPercent, 0);
				}
			}
			else fakeValue = menuReal[$ "info"][menuPointer][2];
		}
	}
}

//Escape
if(menuReal[$ "last_menu"] != "")
{
	if(oGame.menuBack)
	{
		alarm[0] = 1;
		audio_play_sound(snMenuBack, 1, false);
		length = 0;
		currentMenu = menuReal[$ "last_menu"];
	}
}

//Mouse Pressed
if(oGame.menuAccept)
{
	if(menuPointer != -1)
	{
		alarm[0] = 1;
		audio_play_sound(snMenuClick, 1, false);
		
		//Menu system
		switch(menuReal[$ "info"][menuPointer][0])
		{
			case "GOTO":
				length = 0;
				currentMenu = menuReal[$ "info"][menuPointer][2];
			break;
			
			case "TOGGLE":
				if(menuReal[$ "info"][menuPointer][2]) menuReal[$ "info"][menuPointer][2] = false;
				else menuReal[$ "info"][menuPointer][2] = true;
				menuReal[$ "info"][menuPointer][3](menuReal[$ "info"][menuPointer][2]); //send to varible
			break;
			
			case "TOGGLE_EXT":
				menuReal[$ "info"][menuPointer][2] = (menuReal[$ "info"][menuPointer][2]+1);
				if(menuReal[$ "info"][menuPointer][2] > menuReal[$ "info"][menuPointer][4][1]) menuReal[$ "info"][menuPointer][2] = menuReal[$ "info"][menuPointer][4][0];
				menuReal[$ "info"][menuPointer][3](menuReal[$ "info"][menuPointer][2]); //send to varible
			break;
			
			case "ACTION": menuReal[$ "info"][menuPointer][2](); break;
		}
	}
}

if(mouse_check_button_released(mb_left)) canSlide = true;

//position calculations
if(currentMenu != currentMenuLast)
{
	var menuReals = menu[$ currentMenu];
	canSlide = false;
	menu_x = menuReals[$ "positions"][0];
	menu_y = menuReals[$ "positions"][1];
	
	if(menuReals[$ "positions"][1] == -1)
	{
		switch(array_length(menuReals[$ "info"]))
		{
			case 1: menu_y = 85; break;
			case 2: menu_y = 70; break;
			case 3: menu_y = 57; break;
			case 4: menu_y = 45; break;
			case 5: menu_y = 32; break;
		}
	}
	
	menu_top = menu_y + 5 + (gap * array_length(menuReals[$ "info"]));
	menu_largest_string = largest_string_in_array(menuReals[$ "info"]);
	
	switch(menuReals[$ "positions"][2])
	{
		case fa_center:
			menu_left = menu_x-(menu_largest_string*gapX);
			menu_right = menu_x+(menu_largest_string*gapX);
		break;
		
		case fa_left:
			menu_left = menu_x-gapX;
			menu_right = menu_x+(menu_largest_string*gapX)*2;
		break;
		
		case fa_right:
			menu_left = menu_x-(menu_largest_string*gapX)*2;
			menu_right = menu_x+gapX;
		break;
	}
	
}
currentMenuLast = currentMenu;

//Characters
if(currentMenu == "characters") characterXLerp = lerp(characterXLerp, 180, 0.05);

//black recatngle
if(global.blackA >= 0) global.blackA -= 0.05;