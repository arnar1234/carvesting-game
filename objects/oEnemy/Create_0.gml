hsp = 0;
vsp = 0;
hsp_f = 0;
vsp_f = 0;

lastbulletid = -1;

spd = 2;
downSpd = 1;

_input_direction = 0;
input_magnitude = 0;

hspKnockback = 0;
vspKnockback = 0;
deathDir = 0;
deadCounter = 0;

hp = 8;
fire = 0;
iframe = 0;
doOnce_2 = false;
dieOnce = false;

isHit = false;
enemyCanShoot = false;

nearestBarrel = -1;
runFromBarrel = false;

_xx = 0;
_yy = 0;

alarm[0] = random_range(45, 75);

alarm[3] = irandom_range(2, 30);

alarm[4] = 10;

//draw varibles
drawDed = false;
white = false;

//united states of america
state = enemy.alive;

enum enemy
{
	alive,
	down,
	frozen
}

//Specific enemy
wId = 0;

//Enemy One
enemyStats[wId] = ds_map_create();

ds_map_add(enemyStats[wId], "Enemy Type", 0);
ds_map_add(enemyStats[wId], "Hp", 8);
ds_map_add(enemyStats[wId], "Speed", 2);
ds_map_add(enemyStats[wId], "Sprites", [sStopsignIdle, sStopsignWalk, sStopsignHurt, sStopsignDown]);
ds_map_add(enemyStats[wId], "Walking Start", [30, 90]);
ds_map_add(enemyStats[wId], "Walking Stop", [20, 90]);
ds_map_add(enemyStats[wId], "Weapon", 2);

//Enemy Two
wId += 1;
enemyStats[wId] = ds_map_create();

ds_map_add(enemyStats[wId], "Enemy Type", 0);
ds_map_add(enemyStats[wId], "Hp", 6);
ds_map_add(enemyStats[wId], "Speed", 2.5);
ds_map_add(enemyStats[wId], "Sprites", [sPenguinIdle, sPenguinWalk, sPenguinHurt, sPenguinDown]);
ds_map_add(enemyStats[wId], "Walking Start", [30, 90]);
ds_map_add(enemyStats[wId], "Walking Stop", [20, 90]);
ds_map_add(enemyStats[wId], "Weapon", 0);

//Enemy Three
wId += 1;
enemyStats[wId] = ds_map_create();

ds_map_add(enemyStats[wId], "Enemy Type", 1);
ds_map_add(enemyStats[wId], "Hp", 8);
ds_map_add(enemyStats[wId], "Speed", 3);
ds_map_add(enemyStats[wId], "Sprites", [sPlayerIdle, sPlayerWalk, sPlayerHurt, sPlayerDown]);
ds_map_add(enemyStats[wId], "Walking Start", [30, 50]);
ds_map_add(enemyStats[wId], "Walking Stop", [20, 30]);
ds_map_add(enemyStats[wId], "Weapon", 3);


//Enemy Four
wId += 1;
enemyStats[wId] = ds_map_create();

ds_map_add(enemyStats[wId], "Enemy Type", 0);
ds_map_add(enemyStats[wId], "Hp", 8);
ds_map_add(enemyStats[wId], "Speed", 3);
ds_map_add(enemyStats[wId], "Sprites", [sCarmanIdle, sCarmanWalk, sCarmanHurt, sCarmanDown]);
ds_map_add(enemyStats[wId], "Walking Start", [30, 50]);
ds_map_add(enemyStats[wId], "Walking Stop", [20, 30]);
ds_map_add(enemyStats[wId], "Weapon", 5);

//Enemy Five
wId += 1;
enemyStats[wId] = ds_map_create();

ds_map_add(enemyStats[wId], "Enemy Type", 0);
ds_map_add(enemyStats[wId], "Hp", 8);
ds_map_add(enemyStats[wId], "Speed", 3);
ds_map_add(enemyStats[wId], "Sprites", [sStopsignIdle, sStopsignWalk, sStopsignHurt, sStopsignDown]);
ds_map_add(enemyStats[wId], "Walking Start", [30, 50]);
ds_map_add(enemyStats[wId], "Walking Stop", [20, 30]);
ds_map_add(enemyStats[wId], "Weapon", 7);


//Change enemy
alarm[2] = 1;