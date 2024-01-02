if(global.weaponList[global.weaponCurrent] != "Default" && !disable) //Make sure not holding stuff
{
	//Calculating Movement
	finalMeleeAngle = lerp(finalMeleeAngle, meleeAngle, 0.4);
	
	if(weaponType[0] != 1)
	{
		image_xscale = 1;
		if(image_angle > 90) && (image_angle < 270) image_yscale = -1;
		else image_yscale = 1;
		
		image_angle = oGame.aimDir;
	}
	else
	{
		image_yscale = 1;
		image_angle = oGame.aimDir-finalMeleeAngle;
		
		if(sign(finalMeleeAngle) > 0) image_xscale = -1;
		else image_xscale = 1;
	}

	//Lazer distance
	if(lazer != 0) xypos = lineDistance(x+lengthdir_x(lazer*image_yscale, image_angle+90), y+lengthdir_y(lazer*image_yscale, image_angle+90));

	//Homing distance
	homing_xypos = lineDistanceEnemy(x, y);
	
	//Auto or not
	if(auto == false) shootButton = oGame.shootPressed;
	else shootButton = oGame.shoot;

	//Shooting
	if(cooldown >= 0) cooldown -= 1;
	if(global.ammo[ammoType[0]] > 0 && oPlayer.healtol <= 0)
	{
		switch(weaponType[0])
		{		
			case 0: //Normal
			{
				if(shootButton)
				{
					canshoot = true;
					alarm[1] = cooldownMax/2;
				}
			
				if(canshoot)
				{
					if(cooldown < 0)
					{
						canshoot = false;
						cooldown = cooldownMax;
						burst = burstMax;
						alarm[0] = 1;
					}
				}
			}
			break;
		
			case 1: //Melee
			{
				if(shootButton) canshoot = true;
			
				if(canshoot)
				{
					if(cooldown < 0)
					{
						canshoot = false;
						cooldown = cooldownMax;
						burst = burstMax;
						alarm[3] = 1;
					}
				}
			}
			break;
		
			case 2: //Melee No movement
			{
				if(shootButton) canshoot = true;
			
				if(canshoot)
				{
					if(cooldown < 0)
					{
						canshoot = false;
						cooldown = cooldownMax;
						burst = burstMax;
						alarm[4] = 1;
					}
				}
			}
			break;
		
			case 3: //Bow
			{
				if(auto == false)
				{
					if(oGame.shoot)
					{
						if(image_index <= image_number-1) image_speed = 1;
						else image_speed = 0;
				
						if(image_index == 0)
						{
							audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
							audio_play_sound(weaponType[1], 1, false);
						}
					}
					else
					{
						if(image_index >= image_number-1)
						{
							audio_stop_sound(weaponType[1]);
							
							burst = burstMax;
							alarm[0] = 1;
							
							image_index = 0;
							image_speed = 0;
						}
					}
				}
				else //Auto
				{
					if(cooldown < 0)
					{
						if(oGame.shoot)
						{
							if(image_index <= image_number-1) image_speed = 1;
							else image_speed = 0;
				
							if(image_index == 0)
							{
								audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
								audio_play_sound(weaponType[1], 1, false);
							}
						}
					}
					
					if(image_index >= image_number-1)
					{
						audio_stop_sound(weaponType[1]);
								
						image_speed = 0;
						image_index = 0;
						cooldown = cooldownMax;
						burst = burstMax;
						alarm[0] = 1;
					}
					
					//Cancel
					if(!oGame.shoot)
					{
						image_speed = 0;
						image_index = 0;
					}
				}
			}
			break;
		
			case 4: //Charge up thing
			{
				if(auto == false)
				{
					if(oGame.shootPressed)
					{
						canshoot = true;
						alarm[1] = cooldownMax/2;
					}
			
					if(canshoot)
					{
						if(cooldown < 0)
						{
							canshoot = false;
							cooldown = cooldownMax;
							burst = burstMax;
							
							audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
							audio_play_sound(weaponType[1], 1, false);
							
							image_speed = 1;
						}
					}
				
					if(image_index >= image_number-1)
					{
						burst = burstMax;
						alarm[0] = 1;
							
						image_index = 0;
						image_speed = 0;
					}
				}
				else // Auto
				{
					if(oGame.shoot)
					{
						if(image_index <= image_number-1) image_speed = 1;
						else image_speed = 0;
				
						if(image_index == 0)
						{
							audio_sound_pitch(weaponType[1], random_range(0.95, 1.05));
							audio_play_sound(weaponType[1], 1, false);
						}
				
						if(image_index >= image_number-1)
						{
							if(cooldown < 0)
							{
								cooldown = cooldownMax;
								burst = burstMax;
								alarm[0] = 1;
							}
						}
					}
					else
					{
						if(image_index >= image_number-1)
						{
							audio_sound_pitch(weaponType[2], random_range(0.95, 1.05));
							audio_play_sound(weaponType[2], 1, false);
						}
				
						image_speed = 0;
						image_index = 0;
					}
				}
			}
			break;
			
			case 5: //Rpg
			{
				//Animation
				image_speed = 0;
				if(cooldown < 0) image_index = 0;
				else image_index = 1;
				
				if(shootButton)
				{
					canshoot = true;
					alarm[1] = cooldownMax/2;
				}
			
				if(canshoot)
				{
					if(cooldown < 0)
					{
						canshoot = false;
						cooldown = cooldownMax;
						burst = burstMax;
						alarm[0] = 1;
					}
				}
			}
			break;
		}
	}
	else
	{
		image_speed = 0;
		if(weaponType[0] == 5) image_index = 1;
		else image_index = 0;
		
		//No Ammo
		if(global.ammo[ammoType[0]] <= 0)
		{
			if(oGame.shootPressed)
			{
				audio_play_sound(snChest, 1, false);
				createScoreText(x, y-15, "No Ammo", c_white);
			}
		}
	}
}
else sprite_index = noone;

//Cancel auto shoot cuz of cayote time if is auto
if(auto)
{
	if(oGame.shootReleased) canshoot = false;
}

//Timers
weaponChangeCooldown = clamp(weaponChangeCooldown-1, 0, 60);
muzzleTime = clamp(muzzleTime-1, 0, 5);

//Switch weapon
if(oGame.switchW)
{
	if(weaponChangeCooldown <= 0)
	{
		if(array_length(global.weaponList) > 1)
		{
			if(global.weaponCurrent == 0) global.weaponCurrent = 1;
			else global.weaponCurrent = 0;
			changeWeapon();
			cooldown = 0;
			burst = 0;

			audio_play_sound(pickupSound, 1, false);
	
			weaponChangeCooldown = cooldownMax/3;
		}
	}
}