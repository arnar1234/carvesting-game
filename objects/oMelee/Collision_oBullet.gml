if(other.enemyShot) && (bounce != false) && (other.bulletType != 3)
{
	other.speed *= 2;
	
	var melee_dir = direction;
	
	other.direction = melee_dir;
	other.image_angle = melee_dir;
	other.enemyShot = false;
}