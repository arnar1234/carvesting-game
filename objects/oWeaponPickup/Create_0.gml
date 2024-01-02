weaponNumber = irandom_range(2, oGun.wId);
changeNumber = 0;

_y = 0;
pickupName = oGun.weapon[weaponNumber][? "Name"];

var ammoIndex = oGun.weapon[weaponNumber][? "Ammo"][0];
global.ammo[ammoIndex] += oGun.ammoAdd[ammoIndex] + irandom_range(0, 5);
clampAmmo();

drawStuff = false;

hsp = 0;
vsp = 0;

sprite_index = asset_get_index(sprite_get_name(oGun.weapon[weaponNumber][? "Sprite"]) + "Center");
image_speed = 0;

alarm[0] = 3;