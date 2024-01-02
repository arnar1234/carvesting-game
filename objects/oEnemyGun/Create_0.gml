alarm[0] = 3;

a = 1;

doOnce = false;
rot = random_range(-1, 1);

_diff = 0;
draw = true;

eHp = 8;
eX = x;
eY = y;

eXx = 0;
eYy = 0;

//Real code in real life
burst = 0;
meleeAngle = -25;
finalMeleeAngle = 0;

backMax = 0;

//Animation
back = 0;
guiY = 0;
muzzleTime = 0;
muzzleIndex = 0;

shoot_angle = random(360);

//Varibles
weaponType = [0];
burstMax = 0;
burstRate = 0;
damage = 0;
fireDamage = 0;
cooldownMax = [60, 120];
spd = 0;
randomSpd = 0;
pushback = 0;
enemyKnockback = 0;
pattern = 0;
recoil = 0;
sound = snGunSound;
pickupSound = snChangeWeapon;
sprite = sGun1;
bulletSprite = sBullet1;
bulletType = [0];
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

xypos = [0, 0];
homing_xypos = [0, 0];

wId = 0;

//Pistol
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [0]);
ds_map_add(weapon[wId], "BurstMax", 1);
ds_map_add(weapon[wId], "BurstRate", 1);
ds_map_add(weapon[wId], "Damage", 3);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [180, 230]);
ds_map_add(weapon[wId], "Speed", 1.8);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 2);
ds_map_add(weapon[wId], "Enemy Knockback", 2.4);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 10);
ds_map_add(weapon[wId], "Sound", snGunSound);
ds_map_add(weapon[wId], "Sprite", sGun1);
ds_map_add(weapon[wId], "BulletSprite", sBullet1);
ds_map_add(weapon[wId], "BulletType", [0]);
ds_map_add(weapon[wId], "BulletPos", [3, 90]);
ds_map_add(weapon[wId], "Particle Type", [0, 0, 0]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", sMuzzle);
ds_map_add(weapon[wId], "Shell", [sShell, 1, 1]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 4);


//Smg
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [0]);
ds_map_add(weapon[wId], "BurstMax", 5);
ds_map_add(weapon[wId], "BurstRate", 6);
ds_map_add(weapon[wId], "Damage", 2);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [200, 240]);
ds_map_add(weapon[wId], "Speed", 1.8);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 1);
ds_map_add(weapon[wId], "Enemy Knockback", 2.4);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 15);
ds_map_add(weapon[wId], "Sound", snGunSoundEight);
ds_map_add(weapon[wId], "Sprite", sGun7);
ds_map_add(weapon[wId], "BulletSprite", sBullet1);
ds_map_add(weapon[wId], "BulletType", [0]);
ds_map_add(weapon[wId], "BulletPos", [0, 0]);
ds_map_add(weapon[wId], "Particle Type", [0, 0, 0]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", sMuzzle);
ds_map_add(weapon[wId], "Shell", [sShell, 1, 1]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 4);


//Burst M16
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [0]);
ds_map_add(weapon[wId], "BurstMax", 3);
ds_map_add(weapon[wId], "BurstRate", 30);
ds_map_add(weapon[wId], "Damage", 3);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [240, 280]);
ds_map_add(weapon[wId], "Speed", 1.8);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 2);
ds_map_add(weapon[wId], "Enemy Knockback", 2.4);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 15);
ds_map_add(weapon[wId], "Sound", snGunSoundFour);
ds_map_add(weapon[wId], "Sprite", sGun3);
ds_map_add(weapon[wId], "BulletSprite", sBullet1);
ds_map_add(weapon[wId], "BulletType", [0]);
ds_map_add(weapon[wId], "BulletPos", [4, 0]);
ds_map_add(weapon[wId], "Particle Type", [0, 0, 0]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", sMuzzle);
ds_map_add(weapon[wId], "Shell", [sShell, 1, 1]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 4);


//Shovel
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [1, snMelee]); //Woosh Sound on melee
ds_map_add(weapon[wId], "Automatic", false);
ds_map_add(weapon[wId], "BurstMax", 1); 
ds_map_add(weapon[wId], "BurstRate", 1);
ds_map_add(weapon[wId], "Damage", 4);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [80, 160]);
ds_map_add(weapon[wId], "Speed", 1);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 4);
ds_map_add(weapon[wId], "Enemy Knockback", 3.5);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 0);
ds_map_add(weapon[wId], "Sound", snGunSoundSix);
ds_map_add(weapon[wId], "Sprite", sGun5);
ds_map_add(weapon[wId], "BulletSprite", sBullet3);
ds_map_add(weapon[wId], "BulletType", [0]);
ds_map_add(weapon[wId], "BulletPos", [0, 0]);
ds_map_add(weapon[wId], "Particle Type", [0, 0, 0]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", 0);
ds_map_add(weapon[wId], "Shell", [0, 0, 0]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 0);


//Golden Gun
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [3, snMinigunCharge]); //Charge up
ds_map_add(weapon[wId], "BurstMax", 20);
ds_map_add(weapon[wId], "BurstRate", 2);
ds_map_add(weapon[wId], "Damage", 3);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [120, 240]);
ds_map_add(weapon[wId], "Speed", 2);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 1.5);
ds_map_add(weapon[wId], "Enemy Knockback", 2.4);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 8);
ds_map_add(weapon[wId], "Sound", snGunSoundTen);
ds_map_add(weapon[wId], "Sprite", sGun11);
ds_map_add(weapon[wId], "BulletSprite", sBullet1);
ds_map_add(weapon[wId], "BulletType", [0]);
ds_map_add(weapon[wId], "BulletPos", [6, 0]);
ds_map_add(weapon[wId], "Particle Type", [sLightning, true, 0.4]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", sMuzzle);
ds_map_add(weapon[wId], "Shell", [sShell, 1, 1]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 2);


//Solar Cannon
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [4, snLaserCharge]); //Charge up
ds_map_add(weapon[wId], "BurstMax", 1);
ds_map_add(weapon[wId], "BurstRate", 1);
ds_map_add(weapon[wId], "Damage", 3);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [200, 250]);
ds_map_add(weapon[wId], "Speed", 0);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 4);
ds_map_add(weapon[wId], "Enemy Knockback", 5);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 0);
ds_map_add(weapon[wId], "Sound", snGunSoundSixteen);
ds_map_add(weapon[wId], "Sprite", sGun15);
ds_map_add(weapon[wId], "BulletSprite", sBullet12);
ds_map_add(weapon[wId], "BulletType", [3]);
ds_map_add(weapon[wId], "BulletPos", [4, 45]);
ds_map_add(weapon[wId], "Particle Type", [sLightning, true, 0.4]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", 0);
ds_map_add(weapon[wId], "Shell", [0, 0, 0]);
ds_map_add(weapon[wId], "Lazer", 1);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 8);


//Bow
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [3, snBowStretch]);
ds_map_add(weapon[wId], "BurstMax", 1);
ds_map_add(weapon[wId], "BurstRate", 1);
ds_map_add(weapon[wId], "Damage", 3);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [60, 120]);
ds_map_add(weapon[wId], "Speed", 3);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 2);
ds_map_add(weapon[wId], "Enemy Knockback", 2.6);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 1);
ds_map_add(weapon[wId], "Sound", snGunSoundThirteen);
ds_map_add(weapon[wId], "Sprite", sGun13);
ds_map_add(weapon[wId], "BulletSprite", sBullet9);
ds_map_add(weapon[wId], "BulletType", [1]);
ds_map_add(weapon[wId], "BulletPos", [0, 0]);
ds_map_add(weapon[wId], "Particle Type", [sLightning, true, 0.1]);
ds_map_add(weapon[wId], "Bullet Dust Type", 1);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", 0);
ds_map_add(weapon[wId], "Shell", [0, 0, 0]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", false);
ds_map_add(weapon[wId], "Back", 0);


//Boomerang
wId += 1;
weapon[wId] = ds_map_create();

ds_map_add(weapon[wId], "Weapon Type", [5]);
ds_map_add(weapon[wId], "BurstMax", 1);
ds_map_add(weapon[wId], "BurstRate", 1);
ds_map_add(weapon[wId], "Damage", 2);
ds_map_add(weapon[wId], "Fire Damage", 0);
ds_map_add(weapon[wId], "Cooldown", [30, 50]);
ds_map_add(weapon[wId], "Speed", 11);
ds_map_add(weapon[wId], "Random Speed", 0);
ds_map_add(weapon[wId], "Pushback", 0);
ds_map_add(weapon[wId], "Enemy Knockback", 2.4);
ds_map_add(weapon[wId], "Pattern", 0);
ds_map_add(weapon[wId], "Recoil", 5);
ds_map_add(weapon[wId], "Sound", snMeleeThree);
ds_map_add(weapon[wId], "Sprite", sGun18);
ds_map_add(weapon[wId], "BulletSprite", sGun18Center);
ds_map_add(weapon[wId], "BulletType", [4, -12, 0.02]);
ds_map_add(weapon[wId], "BulletPos", [0, 0]);
ds_map_add(weapon[wId], "Particle Type", [sBulletParticle4, false, 0.1]);
ds_map_add(weapon[wId], "Bullet Dust Type", 0);
ds_map_add(weapon[wId], "Amount", 1);
ds_map_add(weapon[wId], "Muzzle", 0);
ds_map_add(weapon[wId], "Shell", [0, 0, 0]);
ds_map_add(weapon[wId], "Lazer", 0);
ds_map_add(weapon[wId], "Homing", [0]);
ds_map_add(weapon[wId], "Friction", 0);
ds_map_add(weapon[wId], "Bounce", -1);
ds_map_add(weapon[wId], "Back", 4);

//change weapon alarm
alarm[7] = 1;