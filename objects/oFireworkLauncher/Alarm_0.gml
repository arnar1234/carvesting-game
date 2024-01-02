if(fireworksLeft > 0)
{
	fireworksLeft -= 1;
	alarm[0] = irandom_range(30, 60);
	instance_create_depth(oCamera.x+irandom_range(-160, 160), oCamera.y+110, depth, oFirework);
}