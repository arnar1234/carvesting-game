/// @description Melee no movement
if(burst > 0) && (eHp > 0)
{
	burst -= 1;
	alarm[4] = burstRate;
	
	meleeEnemy();
}