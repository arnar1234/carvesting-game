direction = dir+sine_wave(current_time / 1000, 1, 5, 0);

with(instance_create_depth(x+random_range(-1, 1), y+random_range(-1, 1), depth+1, oFire)) sprite_index = sFireworkTwo;