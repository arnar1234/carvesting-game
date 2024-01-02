if(room != rMenu)
{
	if(oGame.connected) and (!oPause.pause) and (global.hp > 0)
	{
		var finalMag = clamp(oGame.aimMag, 0.4, 1);
		var finalX = oPlayer.x+lengthdir_x(finalMag*70, oGame.aimDir);
		var finalY = oPlayer.y+lengthdir_y(finalMag*70, oGame.aimDir);
		
		draw_sprite(sCursor, 0, finalX, finalY);
		draw_sprite(sCursorMiddle, 0, finalX, finalY);
	}
}