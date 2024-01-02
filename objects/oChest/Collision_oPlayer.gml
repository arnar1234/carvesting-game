if(image_index == 0) && (instance_exists(oGun))
{
	image_index = 1;

	audio_play_sound(snChest, 1 , false);
	
	with(instance_create_layer(x, y, "Bullets", oWeaponPickup)) vsp = 1;
}