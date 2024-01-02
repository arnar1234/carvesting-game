//Sizing
if(!doOnce)
{
	y -= 0.25;
	image_xscale += 0.003;
}
else image_xscale -= 0.05;

image_yscale = image_xscale;

//Deleting
if(image_xscale <= 0) instance_destroy();