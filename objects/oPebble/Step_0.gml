if(image_xscale <= 0) instance_destroy();

image_xscale -= 0.03;
image_yscale = image_xscale;

if(_sound != false) var soundFinal = sound;
else var soundFinal = -1;

bulletTileCollision(soundFinal);