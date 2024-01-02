function clampAmmo()
{
	with(oGun) for(var i = 0; i < 6; i++) global.ammo[i] = clamp(global.ammo[i], 0, ammoMax[i]);
}