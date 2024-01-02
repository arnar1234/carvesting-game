/// @description Snow
alarm[2] = 6;

instance_create_layer(oCamera.x+random_range(-160, 160), oCamera.y-96, "Weather", oSnow);