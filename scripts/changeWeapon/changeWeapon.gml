function changeWeapon(_guiThing = true)
{
	var finalWeapon = weapon[global.weaponList[weaponCurrent]];
	
	name = weapon[global.weaponList[0]][? "Name"];
	if(array_length(global.weaponList) > 1) name2 = weapon[global.weaponList[1]][? "Name"];
	weaponType = finalWeapon[? "Weapon Type"];
	auto = finalWeapon[? "Automatic"];
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
	screen_shake = finalWeapon[? "ScreenShake"];
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
	zoom = finalWeapon[? "Zoom"];
	
	//Animation
	canshoot = false;
	if(_guiThing) guiY = -2;
	if(weaponType[0] != 1) back = -3;
	else back = 4*image_yscale;
	
	xypos[0] = x;
	xypos[1] = y;
	
	if(image_yscale > 0)
	{
		meleeAngle = -25;
		finalMeleeAngle = 0;
	}
	else
	{
		meleeAngle = 205;
		finalMeleeAngle = 180;
	}
	
	alarm[2] = -1;
	
	image_speed = 0;
	if(weaponType[0] == 5) image_index = 1;
	else image_index = 0;
	
	sprite_index = sprite;
	
	//Width of sprite
	sprite_width_ = abs(sprite_width - sprite_xoffset);
	handSprite = asset_get_index(sprite_get_name(finalWeapon[? "Sprite"]) + "Hand");
}