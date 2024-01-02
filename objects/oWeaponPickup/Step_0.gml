//Collisions
if(hsp != 0 or vsp != 0)
{
	hsp = lerp(hsp, 0, 0.07);
	vsp = lerp(vsp, 0, 0.07);

	tileCollisionBounce();
}


if(oGame.pickup) && (instance_exists(oGun))
{
	if(distance_to_object(oPlayer) < 10)
	{
		createScoreText(x, y, pickupName, c_white);
		
		with(oGun)
		{
			if(global.weaponCurrent == 0) other.pickupName = name;
			else other.pickupName = name2;
			
			other.sprite_index = asset_get_index(sprite_get_name(sprite) + "Center");

			other.changeNumber = global.weaponList[global.weaponCurrent];
			
			if(array_length(global.weaponList) > 1)
			{
				global.weaponList[global.weaponCurrent] = other.weaponNumber;
				other.weaponNumber = other.changeNumber;
				changeWeapon();
				cooldown = 0;
				burst = 0;
	
				weaponChangeCooldown = 10;
			}
			else
			{
				array_push(global.weaponList, other.weaponNumber);
				global.weaponCurrent = 1;
				
				changeWeapon();
				cooldown = 0;
				burst = 0;
	
				weaponChangeCooldown = 10;
				
				instance_destroy(other);
			}
			
			audio_play_sound(pickupSound, 1, false);
		}
	}
}

//Draw Extra Info
if(distance_to_object(oPlayer) < 10) drawStuff = true;
else drawStuff = false;