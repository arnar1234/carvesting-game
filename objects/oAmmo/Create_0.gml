image_speed = 0;
image_xscale = 0;
image_yscale = 0;
size_ = 0;

//Find what ammo type should spawn
gunIndex = 0;


if(global.weaponCurrent == 0)
{
	if(global.ammo[global.weapon[$ global.weaponList[0]][$ "Ammo"][0]] >= oGun.ammoMax[global.weapon[$ global.weaponList[0]][$ "Ammo"][0]]) gunIndex = 1;
	else gunIndex = 0;
}
else
{
	if(global.ammo[global.weapon[$ global.weaponList[1]][$ "Ammo"][0]] >= oGun.ammoMax[global.weapon[$ global.weaponList[1]][$ "Ammo"][0]]) gunIndex = 0;
	else gunIndex = 1;
}

		
gunIndex = clamp(gunIndex, 0, array_length(global.weaponList)-1);
ammoIndex = global.weapon[$ global.weaponList[gunIndex]][$ "Ammo"][0];
if(ammoIndex == 0) ammoIndex = irandom_range(1, 5);
	
//Text and sound stuff based on ammo type
switch(ammoIndex)
{
	case 1: _string_ = " Light Ammo";   ammoSound = snPickupGunFive; break;
	case 2: _string_ = " Heavy Ammo";   ammoSound = snPickupGunTwo; break;
	case 3: _string_ = " Shotgun Ammo"; ammoSound = snPickupGun; break;
	case 4: _string_ = " Rocket Ammo";  ammoSound = snPickupGunThree; break;
	case 5: _string_ = " Energy Ammo";  ammoSound = snPickupGunTen; break;
}
	
//Change image
image_index = ammoIndex;

//start disapearing
alarm[1] = 120;
disapearing = true;
disapearCount = 0;