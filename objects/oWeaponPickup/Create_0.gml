weaponNumber = choose("Pistol", "Fire Shotgun", "Burst Rifle", "Hunting Rifle", "Shovel", "RPG", "HOMING RPG", "SMG", "Chainsaw", "Grenade launcher", "Golden Gun", "Lax Blaster", "Bow", "Laser Pistol", "Solar Cannon", "Revolver", "Boomerang");
changeNumber = 0;

_y = 0;
pickupName = weaponNumber;

var ammoIndex = global.weapon[$ weaponNumber][$ "Ammo"][0];
global.ammo[ammoIndex] += oGun.ammoAdd[ammoIndex] + irandom_range(0, 5);
clampAmmo();

drawStuff = false;

hsp = 0;
vsp = 0;

sprite_index = asset_get_index(sprite_get_name(global.weapon[$ weaponNumber][$ "Sprite"]) + "Center");
image_speed = 0;

alarm[0] = 3;