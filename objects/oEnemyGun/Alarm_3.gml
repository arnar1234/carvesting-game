/// @description Melee
if(burst > 0) && (eHp > 0)
{
	burst -= 1;
	alarm[3] = burstRate;
	
	meleeEnemy();
	
	if(meleeAngle == -25) meleeAngle = 205;
	else meleeAngle = -25;
}