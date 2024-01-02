instance_destroy();
	
//Bloom
oPlayer.vigentteA = 1;

//lighitng
instance_create_layer(x, y, "Bullets", oExplosionLighting);
	
//Create Explosion
maxAmount = irandom_range(8, 12);
for(c = 0; c < maxAmount; c++)
{
	explosionDir = (c * 360/maxAmount) + irandom_range(-45, 45);
	with(instance_create_layer(x+random_range(-10, 10), y+random_range(-10, 10), "Bullets", oExplosion1))
	{
		direction = other.explosionDir;
	}
}

maxAmount = irandom_range(20, 30);
for(c = 0; c < maxAmount; c++)
{
	explosionDir = (c * 360/maxAmount) + irandom_range(-10, 10);
	var explosionLength = irandom_range(10, 20);
	with(instance_create_layer(x+lengthdir_x(explosionLength, explosionDir), y+lengthdir_y(explosionLength, explosionDir), "Bullets", oExplosion2))
	{
		direction = other.explosionDir;
	}
}