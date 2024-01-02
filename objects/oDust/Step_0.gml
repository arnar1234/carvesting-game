image_xscale -= spd;
image_yscale -= spd;

if(image_xscale <= 0 or image_yscale <= 0) instance_destroy();