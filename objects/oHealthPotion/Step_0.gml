if(place_meeting(x, y, oPlayer)) && instance_exists(oGun) && oPlayer.healables < 3
{
	oPlayer.healables += 1;
	audio_sound_pitch(snHealth, random_range(0.95, 1.1));
	audio_play_sound(snHealth, 1, false);
	instance_destroy();
}

if(distance_to_object(oPlayer) < 10) && instance_exists(oGun) && (oPlayer.healables < 3)  move_towards_point(oPlayer.x, oPlayer.y, 2);
else speed = 0;


size_ = clamp(size_+0.1, 0, 1);

image_xscale = size_;
image_yscale = size_;
image_alpha = lerp(image_alpha, disapearing, 0.5);