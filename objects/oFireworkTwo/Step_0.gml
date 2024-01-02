with(instance_create_depth(x+random_range(-1, 1), y+random_range(-1, 1), depth+1, oFire)) sprite_index = sFirework3;

if(speed < 0.15) instance_destroy();
y += 0.6;