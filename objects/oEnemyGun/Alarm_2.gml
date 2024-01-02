/// @description Burst
if(burst > 0) && (eHp > 0)
{
	burst -= 1;
	alarm[2] = burstRate;
	shootingEnemy();
	
	if(weaponType[0] == 5)
	{
		alarm[8] = cooldownMax[0]*0.75;
		image_index = 1;
	}
}