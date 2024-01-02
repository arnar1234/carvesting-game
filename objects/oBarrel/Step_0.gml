//flash
if(isHit > 9) white = true;
else white = false;

if(fire > 0) fireEffect(); //Fire fx
iframe = clamp(iframe-1, 0, 90); //iframes
isHit = clamp(isHit-1, 0, 30); //lower isHit


if(hp <= 0)
{
	//play sound once
	if(doOnce_2 = false)
	{
		doOnce_2 = true;
		if(explosionTimer > 60)
		{
			audio_sound_pitch(snExplosionKettle, random_range(0.98, 1.04));
			audio_play_sound(snExplosionKettle, 1, false);
		}
	}
	
	//Animation
	a = 1.2-(explosionTimer/80);
	fire = 4;
	
	_xx = irandom_range(-1, 1);
	_yy = irandom_range(-1, 1);
	
	//explode when timer runs out
	if(doOnce_2) explosionTimer -= 1;
	if(explosionTimer <= 0)
	{
		createExplosion(x, y);
		instance_destroy();
	}
}
else
{
	if(isHit > 7)
	{
		_xx = irandom_range(-1, 1);
		_yy = irandom_range(-1, 1);
	}
	else if(isHit <= 0)
	{
		_xx = 0;
		_yy = 0;
	}
}

//Physics
hsp = lerp(hsp, 0, 0.07);
vsp = lerp(vsp, 0, 0.07);
	
tileCollisionBounce();