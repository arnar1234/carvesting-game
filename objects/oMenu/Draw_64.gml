//Draw box that everything in the menu is in
draw_sprite_stretched_ext(sBox, 0, menu_left_gui, menu_y_gui, menu_right_gui-menu_left_gui, menu_top_gui-menu_y_gui, c_white, 0.5);

//change starting point
var menuReal = menu[$ currentMenu];
draw_set_halign(menuReal[$ "positions"][2]);

//Draw Title
draw_set_color(c_white);
draw_set_font(fnFont);
var _title = menuReal[$ "title"];
if(is_string(_title[2])) draw_text_outline(_title[0], _title[1], _title[2], c_white);
else draw_sprite(_title[2], 0, _title[0], _title[1]);

//Draw Menu
draw_set_font(fnFontMenu);

for(var i = 0; i < length; i++)
{	
	//Color atributes
	var selectedColor = c_gray;
	var selectedColorSlider = c_ltgray;
	var selectedOffset = 0;
	if(i == menuPointer) { selectedColor = c_white; selectedColorSlider = c_white; selectedOffset = 2; };
	
	var info = menuReal[$ "info"][i];
	if(info[0] == "SLIDER")
	{
		if(menuReal[$ "positions"][2] == fa_left)
		{
			var _text = info[1] + ": ";
			draw_text_outline(menu_x, -selectedOffset+menu_y+i*gap+(length), _text, selectedColor);
			draw_sprite_ext(sSliderBackground, 0, menu_x+((string_length(_text)*16)-6), -selectedOffset+(menu_y+i*gap)+(length)+7, 1, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSliderColor, 0, 2+menu_x+((string_length(_text)*16)-6), -selectedOffset+(menu_y+i*gap)+(length)+9, info[2]*86, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSlider, 0, round((-3+menu_x+((string_length(_text)*16)-6))+info[2]*86), -selectedOffset+(menu_y+i*gap)+(length)+6, 1, 1, 0, selectedColorSlider, 1);
			
			draw_set_font(fnFont);
			draw_set_halign(fa_left);
			draw_text_outline(3+menu_x+((string_length(_text)*16)-6), -selectedOffset+(menu_y+i*gap)+(length)+7, string(round(info[2]*100))+"%", selectedColorSlider);
			draw_set_font(fnFontMenu);
			draw_set_halign(menuReal[$ "positions"][2]);
		}
		else if(menuReal[$ "positions"][2] == fa_center)
		{
			var _text = info[1] + ": ";
			draw_text_outline(menu_x-(string_length(_text)/2)-45, -selectedOffset+menu_y+i*gap+(length), _text, selectedColor);
			draw_sprite_ext(sSliderBackground, 0, menu_x+((string_length(_text)*7)-45), -selectedOffset+(menu_y+i*gap)+(length)+7, 1, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSliderColor, 0, 2+menu_x+((string_length(_text)*7)-45), -selectedOffset+(menu_y+i*gap)+(length)+9, info[2]*86, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSlider, 0, round((-3+menu_x+((string_length(_text)*7)-45))+info[2]*86), -selectedOffset+(menu_y+i*gap)+(length)+6, 1, 1, 0, selectedColorSlider, 1);
			
			draw_set_font(fnFont);
			draw_set_halign(fa_left);
			draw_text_outline(3+menu_x+((string_length(_text)*7)-45), -selectedOffset+(menu_y+i*gap)+(length)+7, string(round(info[2]*100))+"%", selectedColorSlider);
			draw_set_font(fnFontMenu);
			draw_set_halign(menuReal[$ "positions"][2]);
		}
		else if(menuReal[$ "positions"][2] == fa_right)
		{
			var _text = " :" + info[1];
			draw_text_outline(menu_x, -selectedOffset+menu_y+i*gap+(length), _text, selectedColor);
			draw_sprite_ext(sSliderBackground, 0, menu_x-((string_length(_text)*16)+90), -selectedOffset+(menu_y+i*gap)+(length)+7, 1, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSliderColor, 0, 2+menu_x-((string_length(_text)*16)+90), -selectedOffset+(menu_y+i*gap)+(length)+9, info[2]*86, 1, 0, selectedColorSlider, 1);
			draw_sprite_ext(sSlider, 0, round((-3+menu_x-((string_length(_text)*16)+90))+info[2]*86), -selectedOffset+(menu_y+i*gap)+(length)+6, 1, 1, 0, selectedColorSlider, 1);
			
			draw_set_font(fnFont);
			draw_set_halign(fa_left);
			draw_text_outline(3+menu_x-((string_length(_text)*16)+90), -selectedOffset+(menu_y+i*gap)+(length)+7, string(round(info[2]*100))+"%", selectedColorSlider);
			draw_set_font(fnFontMenu);
			draw_set_halign(menuReal[$ "positions"][2]);
		}
	}
	else
	{
		var _text = info[1];
		if(info[0] == "TOGGLE")
		{
			if(info[2]) _text = info[1] + ": ON";
			else _text = info[1] + ": OFF";
		}
		else if(info[0] == "TOGGLE_EXT") _text = info[1] + ": " + string(info[2]);
		draw_text_outline(menu_x, -selectedOffset+menu_y+i*gap+(length), _text, selectedColor);
	}
}

//Characters
if(currentMenu == "characters" && menuPointer != -1) draw_sprite(sCharacters, menuPointer, characterXLerp, 0);

//Black foreground
draw_set_alpha(global.blackA);
draw_set_color(c_black);
draw_rectangle(0, 0, 320, 180, false);
draw_set_alpha(1);

//reset halign and valign
draw_set_halign(fa_left);