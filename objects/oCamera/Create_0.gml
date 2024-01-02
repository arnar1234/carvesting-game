cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;

xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

cursorSize = 1;

//gui fix
guiWidth = 1;
guiHeight = 1;

if(os_browser!= browser_not_a_browser) _browser = true;
else _browser = false;
oldWidth = browser_width;
if(_browser)
{
	guiWidth = 320/display_get_width();
	guiHeight = 180/display_get_height();
	
	alarm[0] = 1;
}