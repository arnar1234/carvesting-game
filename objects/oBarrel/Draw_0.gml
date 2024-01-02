if(white) gpu_set_fog(true, c_white, 0, 0)
draw_sprite_ext(sprite_index, image_index, x+_xx ,y+_yy, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(sBarrelWhite, image_index, x+_xx ,y+_yy, image_xscale, 1, 0, c_white, a);
gpu_set_fog(false, c_white, 0, 0);