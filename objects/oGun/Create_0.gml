disable = false;

ammoMax = [1, 235, 45, 40, 15, 100];
ammoAdd = [0, 70, 10, 25, 6, 40];

shootButton = false;

canshoot = false;
cooldown = 0;
burst = 0;
meleeAngle = -25;
finalMeleeAngle = 0;

backMax = 0;

//Animation
back = 0;
guiY = 0;
muzzleTime = 0;
muzzleIndex = 0;

//Varibles
name = "";
name2 = "";
weaponType = [0];
auto = 0;
burstMax = 0;
burstRate = 0;
damage = 0;
fireDamage = 0;
cooldownMax = 0;
spd = 0;
randomSpd = 0;
pushback = 0;
enemyKnockback = 0;
pattern = 0;
recoil = 0;
screen_shake = 0;
sound = snGunSound;
pickupSound = snChangeWeapon;
sprite = sGun1;
bulletSprite = sBullet1;
bulletType = 0;
bulletTypeSettings = [];
bulletPos = [0, 0];
particleType = 0;
bulletDustType = 0;
amount = 1;
ammoType = [0, 0];
muzzle = 0;
shell = [0, 0, 0];
lazer = 0;
homing = [0];
frict = 0;
bounce = false;
backMax = 0;
zoom = 16;

xypos = [0, 0];
homing_xypos = [0, 0];
handSprite = sGun1Hand;
handColor = oPlayer.player[$ global.currentPlayer][$ "hands"];

weaponChangeCooldown = 0;

//Update info
changeWeapon();

//Add Starter ammo
if(global._stage == 0) global.ammo[ammoType[0]] += ammoAdd[ammoType[0]];
clampAmmo();