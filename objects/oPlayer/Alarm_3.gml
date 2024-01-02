/// @description Fire damage
alarm[3] = 30;

if(global.hp > 0)
{
	if(fire > 0)
	{
		fire -= 1;
		downSpd = 1;
	
		deathDir = irandom(359);
		causeDeath = "FIRE";
		takeDamage(1, false, 0);
	}
}