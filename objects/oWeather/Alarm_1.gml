/// @description Rain
alarm[1] = 8;

instance_create_layer(oCamera.x+random_range(-80, 240), oCamera.y-90, "Weather", oRain);

instance_create_layer(oCamera.x+random_range(-160, 160), oCamera.y+random_range(-90, 90), "Props", oPuddle);