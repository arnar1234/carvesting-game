gpu_set_blendmode(bm_add);
for(var i = 1; i < 10; i++)
{
	draw_sprite_ext(sExplosionInit, image_index, x, y, 1, 1.6, i*36+random_range(-7, 7), c_white, 0.1);
}
gpu_set_blendmode(bm_normal);

draw_self();