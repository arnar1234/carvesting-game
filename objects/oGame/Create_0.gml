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
global.weaponList = ["Pistol"];
global.ammo = [1, 0, 0, 0, 0, 0];

global.weaponCurrent = 0;
global.weapon =
{
	"Default" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 0,
		"BurstRate" : 0,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 5,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 3,
		"ScreenShake" : 2,
		"Sound" : snGunSound,
		"Pickup Sound" : snChangeWeapon,
		"Sprite" : sPixel,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [0, 0],
		"Particle Type" : [0, 0, 0],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [0, 0],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 0,
		"Zoom" : 16
	},

	"Pistol" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 5,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 3,
		"ScreenShake" : 2,
		"Sound" : snGunSound,
		"Pickup Sound" : snPickupGunSix,
		"Sprite" : sGun1,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [3, 90],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [1, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell, 1, 1],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 4,
		"Zoom" : 16
	},

	"Fire Shotgun" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 0.25,
		"Fire Damage" : 1,
		"Cooldown" : 30,
		"Speed" : 4,
		"Random Speed" : 3,
		"Pushback" : 4,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 18,
		"ScreenShake" : 5,
		"Sound" : snGunSoundFifteen,
		"Pickup Sound" : snPickupGunNine,
		"Sprite" : sGun10,
		"BulletSprite" : sBullet1,
		"BulletType" : [1],
		"BulletPos" : [2, 0],
		"Particle Type" : [sBulletParticle3, 0, 0.1],
		"Bullet Dust Type" : 0,
		"Amount" : 5,
		"Ammo" : [3, 1],
		"Muzzle" : 0,
		"Shell" : [sShell2, 1, 30],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0.015,
		"Bounce" : snBulletHit4,
		"Back" : 7,
		"Zoom" : 16
	},

	"Burst Rifle" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 3,
		"BurstRate" : 5,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 16,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 0.4,
		"ScreenShake" : 2,
		"Sound" : snGunSoundFour,
		"Pickup Sound" : snPickupGunFive,
		"Sprite" : sGun3,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [4, 0],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [1, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell, 1, 1],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 4,
		"Zoom" : 16
	},

	"Hunting Rifle" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 9,
		"Fire Damage" : 0,
		"Cooldown" : 60,
		"Speed" : 12,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundFive,
		"Pickup Sound" : snPickupGunTwo,
		"Sprite" : sGun4,
		"BulletSprite" : sBullet1,
		"BulletType" : [1],
		"BulletPos" : [2, 90],
		"Particle Type" : [sLightning, true, 0.025],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [2, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell, 1, 30],
		"Lazer" : 2,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 7,
		"Zoom" : 25
	},

	"Shovel" :
	{
		"Weapon Type" : [1, snMelee],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 6,
		"Fire Damage" : 0,
		"Cooldown" : 30,
		"Speed" : 1,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 3.5,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundSix,
		"Pickup Sound" : snPickupGunSeven,
		"Sprite" : sGun5,
		"BulletSprite" : sBullet3,
		"BulletType" : [0],
		"BulletPos" : [0, 0],
		"Particle Type" : [0, 0, 0],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [0, 0],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : snBulletHit4,
		"Back" : 0,
		"Zoom" : 25
	},

	"RPG" :
	{
		"Weapon Type" : [5],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 4,
		"Fire Damage" : 0,
		"Cooldown" : 100,
		"Speed" : 0.1,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundSeven,
		"Pickup Sound" : snPickupGunThree,
		"Sprite" : sGun16,
		"BulletSprite" : sBullet13,
		"BulletType" : [2],
		"BulletPos" : [2, 45],
		"Particle Type" : [sDust, 0, 0.06],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [4, 1],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : -0.025,
		"Bounce" : false,
		"Back" : 7,
		"Zoom" : 20
	},

	"HOMING RPG" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 4,
		"Fire Damage" : 0,
		"Cooldown" : 120,
		"Speed" : 0.1,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundSeven,
		"Pickup Sound" : snPickupGunThree,
		"Sprite" : sGun6,
		"BulletSprite" : sBullet4,
		"BulletType" : [2],
		"BulletPos" : [2, 45],
		"Particle Type" : [sDust, 0, 0.06],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [4, 1],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [1, 0.05],
		"Friction" : -0.025,
		"Bounce" : false,
		"Back" : 7,
		"Zoom" : 20
	},

	"SMG" :
	{
		"Weapon Type" : [0],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 4,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 1,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 3,
		"ScreenShake" : 2,
		"Sound" : snGunSoundEight,
		"Pickup Sound" : snPickupGunFive,
		"Sprite" : sGun7,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [0, 0],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [1, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell, 1, 1],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 4,
		"Zoom" : 16
	},

	"Chainsaw" :
	{
		"Weapon Type" : [2, snGunSoundThree],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 2,
		"Fire Damage" : 0,
		"Cooldown" : 5,
		"Speed" : 1,
		"Random Speed" : 3,
		"Pushback" : 0.5,
		"Enemy Knockback" : 0.6,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 1,
		"Sound" : snMeleeTwo,
		"Pickup Sound" : snPickupGunFour,
		"Sprite" : sGun8,
		"BulletSprite" : sBullet5,
		"BulletType" : [0],
		"BulletPos" : [0, 0],
		"Particle Type" : [0, 0, 0],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [0, 0],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 2,
		"Zoom" : 16
	},

	"Grenade launcher" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 0.5,
		"Fire Damage" : 0,
		"Cooldown" : 100,
		"Speed" : 3,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundEleven,
		"Pickup Sound" : snPickupGunThree,
		"Sprite" : sGun9,
		"BulletSprite" : sBullet6,
		"BulletType" : [2],
		"BulletPos" : [0, 0],
		"Particle Type" : [sBulletParticle2, 0, 0.05],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [4, 1],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0.0025,
		"Bounce" : snBulletHit2,
		"Back" : 7,
		"Zoom" : 16
	},

	"Golden Gun" :
	{
		"Weapon Type" : [4, snMinigunCharge, snMinigunChargeDown],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 2,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 1.5,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 8,
		"ScreenShake" : 2.5,
		"Sound" : snGunSoundTen,
		"Pickup Sound" : snPickupGunEight,
		"Sprite" : sGun11,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [6, 0],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [1, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell, 1, 1],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 2,
		"Zoom" : 16
	},

	"Lax Blaster" :
	{
		"Weapon Type" : [0],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 3,
		"Fire Damage" : 0,
		"Cooldown" : 5,
		"Speed" : 10,
		"Random Speed" : 0,
		"Pushback" : 1.5,
		"Enemy Knockback" : 2.4,
		"Pattern" : 20,
		"Recoil" : 2,
		"ScreenShake" : 2.5,
		"Sound" : snGunSoundTwelve,
		"Pickup Sound" : snPickupGunTen,
		"Sprite" : sGun12,
		"BulletSprite" : sBullet8,
		"BulletType" : [0],
		"BulletPos" : [8, 0],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 3,
		"Ammo" : [5, 1],
		"Muzzle" : sMuzzle,
		"Shell" : [sShell3, 3, 1],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 4,
		"Zoom" : 16
	},

	"Bow" :
	{
		"Weapon Type" : [3, snBowStretch],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 5,
		"Fire Damage" : 0,
		"Cooldown" : 0,
		"Speed" : 12,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 2.6,
		"Pattern" : 0,
		"Recoil" : 1,
		"ScreenShake" : 2,
		"Sound" : snGunSoundThirteen,
		"Pickup Sound" : snChangeWeapon,
		"Sprite" : sGun13,
		"BulletSprite" : sBullet9,
		"BulletType" : [1],
		"BulletPos" : [0, 0],
		"Particle Type" : [sLightning, true, 0.1],
		"Bullet Dust Type" : 1,
		"Amount" : 1,
		"Ammo" : [2, 1],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 0,
		"Zoom" : 18
	},

	"Laser Pistol" :
	{
		"Weapon Type" : [0],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 4,
		"Fire Damage" : 0,
		"Cooldown" : 14,
		"Speed" : 0,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 3,
		"ScreenShake" : 2,
		"Sound" : snGunSoundFourteen,
		"Pickup Sound" : snPickupGunTen,
		"Sprite" : sGun14,
		"BulletSprite" : sBullet10,
		"BulletType" : [3],
		"BulletPos" : [7, 14],
		"Particle Type" : [0, 0, 0],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [5, 1],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 4,
		"Zoom" : 18
	},

	"Solar Cannon" :
	{
		"Weapon Type" : [4, snLaserCharge],
		"Automatic" : false,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 8,
		"Fire Damage" : 0,
		"Cooldown" : 55,
		"Speed" : 0,
		"Random Speed" : 0,
		"Pushback" : 4,
		"Enemy Knockback" : 5,
		"Pattern" : 0,
		"Recoil" : 0,
		"ScreenShake" : 5,
		"Sound" : snGunSoundSixteen,
		"Pickup Sound" : snPickupGunTen,
		"Sprite" : sGun15,
		"BulletSprite" : sBullet12,
		"BulletType" : [3],
		"BulletPos" : [4, 45],
		"Particle Type" : [sLightning, true, 0.4],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [5, 2],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 8,
		"Zoom" : 16
	},

	"Revolver" :
	{
		"Weapon Type" : [3, snRevolver],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 8,
		"Fire Damage" : 0,
		"Cooldown" : 35,
		"Speed" : 12,
		"Random Speed" : 0,
		"Pushback" : 2,
		"Enemy Knockback" : 4,
		"Pattern" : 0,
		"Recoil" : 3,
		"ScreenShake" : 4,
		"Sound" : snGunSoundSeventeen,
		"Pickup Sound" : snPickupGunEleven,
		"Sprite" : sGun17,
		"BulletSprite" : sBullet1,
		"BulletType" : [0],
		"BulletPos" : [3, 90],
		"Particle Type" : [sLightning, true, 0.2],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [2, 2],
		"Muzzle" : sMuzzle,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : false,
		"Back" : 10,
		"Zoom" : 16
	},

	"Boomerang" :
	{
		"Weapon Type" : [5],
		"Automatic" : true,
		"BurstMax" : 1,
		"BurstRate" : 1,
		"Damage" : 2,
		"Fire Damage" : 0,
		"Cooldown" : 15,
		"Speed" : 11,
		"Random Speed" : 0,
		"Pushback" : 0,
		"Enemy Knockback" : 2.4,
		"Pattern" : 0,
		"Recoil" : 5,
		"ScreenShake" : 0,
		"Sound" : snMeleeThree,
		"Pickup Sound" : snChangeWeapon,
		"Sprite" : sGun18,
		"BulletSprite" : sGun18Center,
		"BulletType" : [4, -12, 0.02],
		"BulletPos" : [-1, 0],
		"Particle Type" : [sBulletParticle4, false, 0.1],
		"Bullet Dust Type" : 0,
		"Amount" : 1,
		"Ammo" : [0, 0],
		"Muzzle" : 0,
		"Shell" : [0, 0, 0],
		"Lazer" : 0,
		"Homing" : [0],
		"Friction" : 0,
		"Bounce" : -1,
		"Back" : 4,
		"Zoom" : 16
	}
}

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