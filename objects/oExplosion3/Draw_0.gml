draw_self();

set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2.5, 2.5, image_angle, #FFAC1C, 0.2);
set_blendmode(bm_normal);