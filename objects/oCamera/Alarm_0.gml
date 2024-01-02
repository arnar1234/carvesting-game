alarm[0] = 2;

if(browser_width != oldWidth)
{
	guiWidth = 320/display_get_width();
	guiHeight = 180/display_get_height();
}
oldWidth = browser_width;