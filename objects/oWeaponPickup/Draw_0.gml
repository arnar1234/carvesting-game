draw_sprite(sprite_index, 0, x, y+_y);

draw_set_font(fnFontSmall);
draw_set_halign(fa_center);

if(drawStuff)
{
	//Change sprite when using controller
	if(oGame.connected) draw_sprite(sGunPickupEffect, global.controllerLayout, x, y-5);
	else draw_sprite(sGunPickupEffect, 0, x, y-5);
	draw_text_outline(x, y-30, pickupName, c_white);
}

draw_set_halign(fa_left);