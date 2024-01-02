/// @description Shoot
if(eHp > 0) && (global.hp > 0)
{
	alarm[1] = random_range(cooldownMax[0], cooldownMax[1]);
	
	//Shoot
	if(_id.enemyCanShoot)
	{
		switch(weaponType[0])
		{		
			case 0: //Normal
			{
				burst = burstMax;
				alarm[2] = 1;
			}
			break;
		
			case 1: //Melee
			{
				burst = burstMax;
				alarm[3] = 1;
			}
			break;
		
			case 2: //Melee No movement
			{
				burst = burstMax;
				alarm[4] = 1;
			}
			break;
		
			case 3: //Charge up thing
			{
				audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
				audio_play_sound_at(weaponType[1], x-oPlayer.x, y-oPlayer.y, 0, 140, 180, 0.5, 0, 1, 0.5);
							
				image_speed = 1;
				image_index = 0;
			}
			break;
			
			case 4: //Charge up thing but guy stops n stuff
			{
				audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
				audio_play_sound_at(weaponType[1], x-oPlayer.x, y-oPlayer.y, 0, 140, 180, 0.5, 0, 1, 0.5);
							
				image_speed = 1;
				image_index = 0;
			}
			break;
			
			case 5: //Rpg
			{
				//Animation
				image_speed = 0;
			
				burst = burstMax;
				alarm[2] = 1;
			}
			break;
		}
	}
}