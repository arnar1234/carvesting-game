if(!doThing) image_xscale += spd;
else image_xscale -= spd*2;
image_yscale = image_xscale;

if(image_xscale > _max)
{
	doThing = true;
}
if(image_xscale <= 0) instance_destroy();