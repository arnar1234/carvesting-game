pause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;

guiWidth_ = 0;
guiHeight_ = 0;

//Game resolution
resW = 320;
resH = 180;

//The Menu
menu = ["RESUME", "SETTINGS", "MAIN MENU"];
settings = ["VIDEO", "AUDIO", "CONTROLLER"];
video = ["FULLSCREEN: OFF", ["SHAKE: ", global.screenShakePercent], "BLOOD: ON", "WEATHER: ON", "BLOOM: ON"];
audio = [["AUDIO: ", global.masterPercent], ["MUSIC: ", global.musicPercent]];
controls = [["VIBRATION: ", global.vibrationPercent], "LAYOUT: 1"];
currentMenu = menu;
currentMenuLast = 0;
currentMenuLastSlider = 0;
lastMenu = menu;
menuPointer = 0;
oldMenuPointer = 0;

//Slider stuff
fakeValue = 0;
canSlide = true;

//css type bullshit
menu_x = resW div 2;
menu_y = 60;
margin = 6;
fontHeight = font_get_size(fnFontMenu);
gap = fontHeight+margin;
gapX = 9;

//position calculations
menu_top = menu_y + (gap * array_length(currentMenu))+5;
menu_largest_string = largest_string_in_array_pause(currentMenu);
menu_left = menu_x-(menu_largest_string*gapX);
menu_right = menu_x+(menu_largest_string*gapX);

//The black rectangle
menu_left_gui = menu_left+40;
menu_right_gui = menu_right-40;
menu_y_gui = menu_y+40;
menu_top_gui = menu_top-40;

length = 0;

//Render
r = 0;