instance_destroy();

maxAmount = irandom_range(10, 15);
for(c = 0; c < maxAmount; c++)
{
	explosionDir = (c * 360/maxAmount) + irandom_range(-10, 10);
	var explosionLength = irandom_range(10, 20);
	with(instance_create_depth(x+lengthdir_x(explosionLength, explosionDir), y+lengthdir_y(explosionLength, explosionDir), depth, oFireworkTwo))
	{
		direction = other.explosionDir;
	}
}


maxAmount = irandom_range(14, 20);
for(c = 0; c < maxAmount; c++)
{
	explosionDir = (c * 360/maxAmount) + irandom_range(-10, 10);
	var explosionLength = irandom_range(20, 35);
	with(instance_create_depth(x+lengthdir_x(explosionLength, explosionDir), y+lengthdir_y(explosionLength, explosionDir), depth, oFireworkThree))
	{
		direction = other.explosionDir;
	}
}

var sn = choose(snFireworkShoot, snFireworkShoot2, snFireworkShoot3);
audio_sound_pitch(sn, random_range(0.95, 1.05));
audio_play_sound(sn, 1, false);