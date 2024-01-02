if(instance_exists(follow)) && instance_exists(oGun)
{
	if(oGame.connected)
	{
		xTo = follow.x + lengthdir_x(oGame.aimMag*oGun.zoom, oGame.aimDir);
		yTo = follow.y + lengthdir_y(oGame.aimMag*oGun.zoom, oGame.aimDir);
	}
	else
	{
		move_towards_point(mouse_x, mouse_y, 0);
		xTo = follow.x + lengthdir_x(min(oGun.zoom,distance_to_point(mouse_x, mouse_y)), direction);
		yTo = follow.y + lengthdir_y(min(oGun.zoom,distance_to_point(mouse_x, mouse_y)), direction);
	}
}

//update camera
if(instance_exists(oPause))
{
	if(!oPause.pause) && (global.hp > 0)
	{
		x += (xTo - x) / 10;
		y += (yTo - y) / 10;
	}
}

//position
camera_set_view_pos(cam, floor(x-view_w_half), floor(y-view_h_half));

//ScreenShake
x += random_range(-shake_remain*global.screenShakePercent,shake_remain*global.screenShakePercent);
y += random_range(-shake_remain*global.screenShakePercent,shake_remain*global.screenShakePercent);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Vibration in controller
gamepad_set_vibration(0, shake_remain*global.vibrationPercent, shake_remain*global.vibrationPercent);

//Cursor Size
cursorSize = lerp(cursorSize, 1, 0.1);