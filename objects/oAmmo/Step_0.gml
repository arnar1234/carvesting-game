if(place_meeting(x, y, oPlayer)) && (instance_exists(oGun))
{
	//Add more ammo
	var ammoAdded = oGun.ammoAdd[ammoIndex] + irandom_range(0, 5);
	global.ammo[ammoIndex] += ammoAdded;
	clampAmmo();
		
	//Spawn in text
	audio_play_sound(ammoSound, 1, false);
	if(global.ammo[ammoIndex] >= oGun.ammoMax[ammoIndex]) createScoreText(x, y-10, "Max"+_string_, c_white);
	else createScoreText(x, y-10, "+"+string(ammoAdded)+_string_, c_white);
	
	instance_destroy();
}

if(distance_to_object(oPlayer) < 10) && instance_exists(oGun) move_towards_point(oPlayer.x, oPlayer.y, 2);
else speed = 0;

size_ = clamp(size_+0.1, 0, 1);

image_xscale = size_;
image_yscale = size_;

image_alpha = lerp(image_alpha, disapearing, 0.5);