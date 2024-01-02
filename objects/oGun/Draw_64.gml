if(!oPause.pause)
{
	if(array_length(global.weaponList) > 1)
	{
		if(weaponCurrent == 0)
		{
			draw_set_font(fnFontSmall);
			draw_text_outline(4, 129, name2, #A56969);
			draw_set_font(fnFont);
			draw_text_outline(4, 138+guiY, name, c_white);
		}
		else
		{
			draw_set_font(fnFontSmall);
			draw_text_outline(4, 129, name, #A56969);
			draw_set_font(fnFont);
			draw_text_outline(4, 138+guiY, name2, c_white);
		}
	}
	else draw_text_outline(4, 138, name, c_white);
	
	draw_sprite(sAmmo, ammoType[0], 96+15, 158);
	draw_sprite_part(sAmmoBack, ammoType[0], 0, 0, 16, 16-round((global.ammo[ammoType[0]]/ammoMax[ammoType[0]])*16), 96+15, 158);
	if(ammoType[0] != 0)
	{
		if(global.ammo[ammoType[0]] >= ammoMax[ammoType[0]]*0.2) draw_text_outline(113+15, 156, global.ammo[ammoType[0]], c_white);
		else draw_text_outline(113+15, 156, global.ammo[ammoType[0]], #AA4A44);
	}
}