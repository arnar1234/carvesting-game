if(bulletType == 2)
{
	if(isExplosive)
	{
		createExplosion(x, y, true);
		instance_destroy();
	}
}

if(enemyShot) && (other.lastbulletid != id)
{
	if(fireDamage_ > 0) oPlayer.fire += fireDamage_;
	else other.lastbulletid = id;
	takeDamage(damage);
	
	other.deathDir = image_angle;
	other.causeDeath = "BULLET";
	other.downSpd = 3;
	
	other.hspKnockback = lengthdir_x(enemyKnockback, other.deathDir);
	other.vspKnockback = lengthdir_y(enemyKnockback, other.deathDir);
	
	//blood
	if(oPlayer.player[$ global.currentPlayer][$ "blood"] == 1)
	{
		enemyDust(image_angle);
		draw_blood(x, y, random_range(0.5, 0.8), random(359), 0.8);
	}
	
	
	//Destroy bullet
	if(bulletType == 0) instance_destroy();
	else if(bulletType == 2)
	{
		createExplosion(x+lengthdir_x(16, image_angle), y+lengthdir_y(16, image_angle), true);
		instance_destroy();
	}
}