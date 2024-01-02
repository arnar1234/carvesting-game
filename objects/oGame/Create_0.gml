randomize();

//show_debug_overlay(true); //remove sometime

//Input
aimDir = 0;
aimMag = 0;
connected = false;

left = 0;
right = 0;
up = 0;
down = 0;

dir = 0;
mag = 0;
horiMag = 0;

heal = 0;
healPressed = 0;
healReleased = 0;

switchW = 0;
pickup = 0;

shoot = 0;
shootPressed = 0;
shootReleased = 0;

secondaryPressed = 0;

menuBack = 0;
menuAccept = 0;
menuPause = 0;
menuHorizontal = 0;

gamepad_set_axis_deadzone(0, 0.08);

menuOnce = false;
menuUp = false;
menuDown = false;

//Player
global.currentPlayer = "rob";
global.weaponList = [1];
global.ammo = [1, 0, 0, 0, 0, 0];

//Video Settings
global.fullscreen = false;
global.screenShakePercent = 1;
global.blood = true;
global.weatherSettings = true;
global.bloom = true;

//Sounds Settings
global.masterPercent = 0.5;
global.musicPercent = 0.5;

//Controller Settings
global.vibrationPercent = 1;
global.controllerLayout = 1;

//Global Varibles
global.hpMax = 7;
global.hp = global.hpMax;

//Score varibles
global._score = 0;
global._scoreBar = 0;
global._scoreBarMax = 10000;
global._level = 1;
global.pb = 0;

//Level settings
global._stage = 0;
global._weather = 2;
global._night = false;
global._fog = false;
global._floorPhysics = false;

//Level Sprites
global._background = sSnow;

//Disable cursor
window_set_cursor(cr_none);

//Black rectangle in menu
global.blackA = 0;

//Load audio groups
audio_group_load(agSfx);

//Check if game is running in browser
if(os_browser == browser_not_a_browser) browser = false;
else
{
	browser = true;
	alarm[0] = 1;
}

//Audio stuff
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_listener_orientation(0, 1, 0, 1, 0, 1);


//Load Save
if(file_exists("save.txt"))
{
	var _buffer = buffer_load("save.txt");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	while(array_length(_loadData) > 0)
	{
		var _loadEntity = array_pop(_loadData);
		
		//Varibles
		if(variable_instance_exists(_loadEntity, "_screenShake")) global.screenShakePercent = _loadEntity._screenShake;
		if(variable_instance_exists(_loadEntity, "_masterPercent")) global.masterPercent = _loadEntity._masterPercent;
		if(variable_instance_exists(_loadEntity, "_musicPercent")) global.musicPercent = _loadEntity._musicPercent;
		if(variable_instance_exists(_loadEntity, "_blood")) global.blood = _loadEntity._blood;
		if(variable_instance_exists(_loadEntity, "_vibrationPercent")) global.vibrationPercent = _loadEntity._vibrationPercent;
		if(variable_instance_exists(_loadEntity, "_controllerLayout")) global.controllerLayout = _loadEntity._controllerLayout;
		if(variable_instance_exists(_loadEntity, "_weatherSettings")) global.weatherSettings = _loadEntity._weatherSettings;
		if(variable_instance_exists(_loadEntity, "_bloom")) global.bloom = _loadEntity._bloom;
		if(variable_instance_exists(_loadEntity, "_pb")) global.pb = _loadEntity._pb;
	}
}