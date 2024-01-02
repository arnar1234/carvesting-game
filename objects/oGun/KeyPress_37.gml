/// @description Debug Testing -
if(global.weaponList[weaponCurrent] <= 1) global.weaponList[weaponCurrent] = wId+1;
global.weaponList[weaponCurrent] -= 1;
changeWeapon();
cooldown = 0;
burst = 0;

global.ammo[ammoType[0]] += 260;
clampAmmo();

audio_play_sound(pickupSound, 1, false);