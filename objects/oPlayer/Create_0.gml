//Movement
hsp = 0;
vsp = 0;
hsp_f = 0;
vsp_f = 0;
frict = 0.5;

hspKnockback = 0;
vspKnockback = 0;

deathDir = 0;
causeDeath = "UNKNOWN";
dieOnce = false;
downSpd = 3;

downGui_a = -2;
pb_a = -4;
pb_size = 1;
newPb = false;
gameOverPointer = -1;
gameOverCurrent = 0;
oldGameOverPointer = gameOverPointer;
menuY = [115, 144, 91, 31];

//Fire damage
fire = 0;
alarm[3] = 30;

healables = 1;
healcooldown = 0;
healtol = 0;
healspd = 1;
currentscore = 0;

lastbulletid = -1;

vigentteA = 0;
vigentteD = 0;
vignetteColor = c_red;

enemyDamageTick = 0;

//Characters
player =
{
	"rob" :
	{
		"hp" : 6,
		"blood" : 2,
		"weapon" : ["Laser Pistol"],
		"spd" : 2.5,
		"hat" : -1,
		"hurtFx" : snDamage2,
		"hands" : #63675F,
		"power" : 0,
		"spriteName" : "Rob"
	},
	
	"fisherman" :
	{
		"hp" : 7,
		"blood" : 1,
		"weapon" : ["Fire Shotgun"],
		"spd" : 2.5,
		"hat" : sFishermanHat,
		"hurtFx" : snDamage,
		"hands" : #F79779,
		"power" : 1,
		"spriteName" : "Player"
	},
	
	"stopsign" :
	{
		"hp" : 5,
		"blood" : 0,
		"weapon" : ["Chainsaw"],
		"spd" : 2.5,
		"hat" : -1,
		"hurtFx" : snDamage,
		"hands" : #DBDBDB,
		"power" : 2,
		"spriteName" : "Stopsign"
	},
	
	"carman" :
	{
		"hp" : 8,
		"blood" : 2,
		"weapon" : ["Burst Rifle"],
		"spd" : 2.5,
		"hat" : -1,
		"hurtFx" : snDamage2,
		"hands" : #005F41,
		"power" : 3,
		"spriteName" : "Carman"
	},
	
	"penguin" :
	{
		"hp" : 6,
		"blood" : 1,
		"weapon" : ["Hunting Rifle"],
		"spd" : 2.5,
		"hat" : -1,
		"hurtFx" : snDamage,
		"hands" : #C5CDDB,
		"power" : 4,
		"spriteName" : "Penguin"
	}
};

//Stats
_player = player[$ global.currentPlayer][$ "spriteName"];
sprites =
{
	"idle" : asset_get_index("s" + _player + "Idle"),
	"walk" : asset_get_index("s" + _player + "Walk"),
	"down" : asset_get_index("s" + _player + "Down"),
	"hurt" : asset_get_index("s" + _player + "Hurt")
}


if(global._stage == 0)
{
	global.hp = player[$ global.currentPlayer][$ "hp"];
	global.hpMax = player[$ global.currentPlayer][$ "hp"];
	global.weaponList = player[$ global.currentPlayer][$ "weapon"];
	global.weaponCurrent = 0;
}

spdMax = player[$ global.currentPlayer][$ "spd"];
spd = spdMax;
hpGui = global.hp;
hpRatio = 0;
hpRatioGui = 0;
hpString = hpGui;
_power = player[$ global.currentPlayer][$ "power"];

//United States of america
state = PLAYER.FREE;

enum PLAYER
{
	FREE,
	DEAD,
	WALLS
}

//Character spesific varibles
//Rob

stamina = 20;
staminaAlpha = 0;
staminaGoto = 0;
stopJiter = false;

//Penguin


//Gui
textSize = 1;
scoreBarRatio = 0;
scoreBarRatioFinal = 0;

r = 255;
g = 255;
b = 255;

finalScore = global._score;
finalScoreBar = global._scoreBar;
color = -1;

//Collistions
mask_index = sPlayer;

//Instances
instance_create_depth(x, y, depth-3, oCamera);
instance_create_depth(x, y, depth-3, oGun);
instance_create_depth(x, y, depth-9, oPause);

// Get the tile layer map id
_floor_id = layer_tilemap_get_id("Floor");
_floor_map_id = layer_tilemap_get_id("Floor2");
_wall_under_map_id = layer_tilemap_get_id("TilesUnder");

walkOnce = false;
walkSound = snWalkOne;