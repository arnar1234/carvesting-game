/// @description Burst Melee No movement
if(burst > 0)
{
	burst -= 1;
	alarm[4] = burstRate;
	melee();
}