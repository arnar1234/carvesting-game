menu = 
{
	"menu" : 
	{
		"last_menu" : "",
		"positions" : [160, 80, fa_center],
		"title" : [71, 10, sTitle],
		"info" : 
		[
			["GOTO", "PLAY", "play"],
			["GOTO", "SETTINGS", "settings"],
			["ACTION", "QUIT", function() { game_end(); }]
		]
	},
	
	"play" :
	{
		"last_menu" : "menu",
		"positions" : [160, -1, fa_center],
		"title" : [160, 4, "PLAY"],
		"info" : 
		[
			["ACTION", "SINGLEPLAYER", function() { length = 0; currentMenu = "characters"; characterXLerp = 320; }],
			["GOTO", "MULTIPLAYER", ""]
		]
	},
	
	"characters" :
	{
		"last_menu" : "play",
		"positions" : [5, -1, fa_left],
		"title" : [5, 4, "CHOOSE GUY"],
		"info" : 
		[
			["ACTION", "ROB", function() { start_game("rob"); }],
			["ACTION", "FISHERMAN", function() { start_game("fisherman"); }],
			["ACTION", "STOPSIGN", function() { start_game("stopsign"); }],
			["ACTION", "CARMAN", function() { start_game("carman"); }],
			["ACTION", "PENGUIN", function() { start_game("penguin"); }]
		]
	},
	
	"settings" :
	{
		"last_menu" : "menu",
		"positions" : [160, -1, fa_center],
		"title" : [160, 4, "SETTINGS"],
		"info" : 
		[
			["GOTO", "VIDEO", "video"],
			["GOTO", "AUDIO", "audio"],
			["GOTO", "CONTROLLER", "controls"]
		]
	},
	
	"video" :
	{
		"last_menu" : "settings",
		"positions" : [160, -1, fa_center],
		"title" : [160, 4, "VIDEO"],
		"info" : 
		[
			["TOGGLE", "FULLSCREEN", global.fullscreen, function(v) { global.fullscreen = v; window_set_fullscreen(global.fullscreen)}],
			["SLIDER", "SHAKE", global.screenShakePercent, function(v) { global.screenShakePercent = v;}],
			["TOGGLE", "BLOOD", global.blood, function(v) { global.blood = v;}],
			["TOGGLE", "WEATHER", global.weatherSettings, function(v) { global.weatherSettings = v;}],
			["TOGGLE", "BLOOM", global.bloom, function(v) { global.bloom = v;}],
		]
	},
	
	"audio" : 
	{
		"last_menu" : "settings",
		"positions" : [160, -1, fa_center],
		"title" : [160, 4, "AUDIO"],
		"info" : 
		[
			["SLIDER", "AUDIO", global.masterPercent, function(v) { global.masterPercent = v;}],
			["SLIDER", "MUSIC", global.musicPercent, function(v) { global.musicPercent = v;}],
		]
	},
	
	"controls" :
	{
		"last_menu" : "settings",
		"positions" : [160, -1, fa_center],
		"title" : [160, 4, "CONTROLLER"],
		"info" : 
		[
			["SLIDER", "VIBRATION", global.vibrationPercent, function(v) { global.vibrationPercent = v;}],
			["TOGGLE_EXT", "LAYOUT", global.controllerLayout, function(v) { global.controllerLayout = v;}, [1, 2]],
		]
	}
};

currentMenu = "menu";
currentMenuLast = 0;
currentMenuLastSlider = 0;
lastMenu = "";
menuPointer = 0;
oldMenuPointer = 0;

//Slider stuff
fakeValue = 0;
canSlide = true;

//css type bullshit
menu_x = 160;
menu_y = 80;
margin = 6;
fontHeight = font_get_size(fnFontMenu);
gap = fontHeight+margin;
gapX = 9;

//position calculations
menu_top = menu_y + 5 + (gap * array_length(menu[$ currentMenu][$ "info"]));
menu_largest_string = largest_string_in_array(menu[$ currentMenu][$ "info"]);
menu_left = menu_x-(menu_largest_string*gapX);
menu_right = menu_x+(menu_largest_string*gapX);

//characters
characterX = 320;
characterXLerp = 320;

//The black rectangle
menu_left_gui = menu_left-10;
menu_right_gui = menu_right+10;
menu_y_gui = menu_y;
menu_top_gui = menu_top+6;

length = 3;

//Load sounds
audio_group_set_gain(agSfx, global.masterPercent, 0);
audio_group_set_gain(audiogroup_default, global.musicPercent, 0);

//Play Menu music
audio_play_sound(snMenuMusic, 2, true);