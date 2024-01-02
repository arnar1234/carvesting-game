/// @description Change weapon
var finalWeapon = weapon[weaponCurrent];

weaponType = finalWeapon[? "Weapon Type"];
burstMax = finalWeapon[? "BurstMax"];
burstRate = finalWeapon[? "BurstRate"];
damage = finalWeapon[? "Damage"];
fireDamage = finalWeapon[? "Fire Damage"];
cooldownMax = finalWeapon[? "Cooldown"];
spd = finalWeapon[? "Speed"];
randomSpd = finalWeapon[? "Random Speed"];
pushback = finalWeapon[? "Pushback"];
enemyKnockback = finalWeapon[? "Enemy Knockback"];
pattern = finalWeapon[? "Pattern"];
recoil = finalWeapon[? "Recoil"];
sound = finalWeapon[? "Sound"];
pickupSound = finalWeapon[? "Pickup Sound"];
sprite = finalWeapon[? "Sprite"];
bulletSprite = finalWeapon[? "BulletSprite"];
bulletType = finalWeapon[? "BulletType"][0];
bulletTypeSettings = finalWeapon[? "BulletType"];
bulletPos = finalWeapon[? "BulletPos"];
particleType = finalWeapon[? "Particle Type"];
bulletDustType = finalWeapon[? "Bullet Dust Type"];
amount = finalWeapon[? "Amount"];
ammoType = finalWeapon[? "Ammo"];
muzzle = finalWeapon[? "Muzzle"];
shell = finalWeapon[? "Shell"];
lazer = finalWeapon[? "Lazer"];
homing = finalWeapon[? "Homing"];
frict = finalWeapon[? "Friction"];
bounce = finalWeapon[? "Bounce"];
backMax = finalWeapon[? "Back"];
	
//Animation	
image_speed = 0;
image_index = 0;
	
sprite_index = sprite;
gunSprite = asset_get_index(sprite_get_name(sprite_index) + "Center");
	
//Width of sprite
sprite_width_ = abs(sprite_width - sprite_xoffset);


//Shoot
alarm[1] = random_range(cooldownMax[0], cooldownMax[1]);