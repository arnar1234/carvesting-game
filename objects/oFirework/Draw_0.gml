draw_self();

//Lighting
set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 1.25, 1.25, image_angle, c_white, 0.3);
set_blendmode(bm_normal);