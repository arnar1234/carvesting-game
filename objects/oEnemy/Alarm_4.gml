/// @description Can shoot and barrel checks
alarm[4] = 10;

//Barrel running
nearestBarrel = instance_nearest(x, y, oBarrel);
if(distance_to_object(nearestBarrel) < 125)
{
	if(nearestBarrel.hp <= 0) runFromBarrel = true;
	else runFromBarrel = false;
}
else runFromBarrel = false;


//Can shoot
if(enemyType == 0)
{
	if(in_line_of_sight(x, y)) enemyCanShoot = true;
	else enemyCanShoot = false;
}
else if(enemyType == 1)
{
	if(distance_to_object(oPlayer) < 100)
	{
		if(in_line_of_sight(x, y)) enemyCanShoot = true;
		else enemyCanShoot = false;
	}
	else enemyCanShoot = false;
}