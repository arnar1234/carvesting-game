image_xscale = random_range(0.4, 0.6);
image_yscale = image_xscale;

image_angle = random(360);
speed = random_range(2, 3);
friction = 0.1;

screenShake(8, 30);

doThing = false;
spd = random_range(0.05, 0.075);
_max = random_range(1.4, 1.8);

image_blend = choose(c_white, c_black);

//Damaged Sprite
ssize = random_range(0.5, 1);
if(surface_exists(oEnemyDead.enemySurface))
{
	surface_set_target(oEnemyDead.enemySurface);
	
	draw_sprite_ext(sExplosion3, 0, x, y, ssize, ssize, random(360), c_white, 0.7);
	
	surface_reset_target();
}