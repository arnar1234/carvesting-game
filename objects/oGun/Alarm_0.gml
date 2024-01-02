/// @description Burst
if(burst > 0)
{
	burst -= 1;
	alarm[0] = burstRate;
	shooting();
}