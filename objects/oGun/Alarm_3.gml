/// @description Burst Melee
if(burst > 0)
{
	burst -= 1;
	alarm[3] = burstRate;
	
	
	melee();
	
	if(meleeAngle == -25) meleeAngle = 205;
	else meleeAngle = -25;
}