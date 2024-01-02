function playerFree()
{
	//Movement
	if(!oGame.connected) input_magnitude = (key_right - key_left != 0) or (key_down - key_up != 0)
	else input_magnitude = oGame.mag;

	hsp += lengthdir_x(input_magnitude * spd * healspd, oGame.dir) + hspKnockback;
	vsp += lengthdir_y(input_magnitude * spd * healspd, oGame.dir) + vspKnockback;
	
	hsp = lerp(hsp, 0, frict);
	vsp = lerp(vsp, 0, frict);
	
	tileCollision();
	hspKnockback = max(0,abs(hspKnockback)-0.8)*sign(hspKnockback);
	vspKnockback = max(0,abs(vspKnockback)-0.8)*sign(vspKnockback);
	
	//Healing
	healcooldown = clamp(healcooldown-1, 0, 120);
	healables = clamp(healables, 0, 3);
	if(healables > 0) && (oGame.heal) && (global.hp < global.hpMax) && (healcooldown <= 0)
	{
		healtol += 1;
		healspd = 0.5;
		
		vignetteColor = c_green;
		vigentteD = (healtol/60)*0.5;
		
		if(healtol == 1)
		{
			audio_sound_pitch(snPotionDrink, random_range(0.95, 1.05));
			audio_play_sound(snPotionDrink, 1, false);
		}
		
		if(healtol >= 60)
		{
			var oldhp = clamp(global.hp, 0, global.hpMax);
			healcooldown = 60;
			healtol = 0;
			
			healables -= 1;
			var randomValue = choose(2, 3)
			takeDamage(randomValue, true);
			
			var newHp = clamp(global.hp, 0, global.hpMax);
			createScoreText(x, y-15, "+" + string(abs(newHp-oldhp)) + " Health", c_white);
			screenShake(3, 5);
			
			audio_sound_pitch(snHealthDone, random_range(0.95, 1.05));
			audio_play_sound(snHealthDone, 1, false);
			
			with(oGun)
			{
				if(weaponType[0] != 1) back = -3;
				else back = 4*image_yscale;
			}
		}
	}
	else
	{
		healspd = 1;
		healtol = 0;
		
		if(oGame.healReleased) audio_stop_sound(snPotionDrink);
	}
	
	if(global.hp >= global.hpMax) && (oGame.healPressed)
	{
		audio_play_sound(snChest, 1, false);
		createScoreText(x, y-15, "Max Health!", c_white);
	}
	
	//Powers
	switch(_power)
	{
		case 0:
			stamina = clamp(stamina + 0.05, 0, 20);
			if(oGame.secondaryPressed)
			{
				oGun.disable = true;
				mask_index = sRobIdle;
				image_index = 0;
				state = PLAYER.WALLS;
			}
		break;
		
		case 4:
			if(oGame.secondaryPressed)
			{
				if(stamina > 0)
				{
					stamina -= 2;
					destroyTilesSmooth(x, y);
				}
			}
		break;
	}

	//Animation
	if(vigentteD > 0 and vignetteColor == c_red) sprite_index = sprites[$ "hurt"];
	else
	{
		if(input_magnitude != 0)
		{
			image_speed = point_distance(0, 0, hsp, vsp)/spdMax;
			sprite_index = sprites[$ "walk"];
		}
		else
		{
			image_speed = 1;
			sprite_index = sprites[$ "idle"];
		}
	}

	if(oGame.aimDir > 90) && (oGame.aimDir < 270) image_xscale = -1;
	else image_xscale = 1;

	//Fire fx
	if(fire > 0) fireEffect();
	
	//Dust
	var _floor_map_check = tilemap_get_at_pixel(_floor_map_id, x, y);

	if(sprite_index == sprites[$ "walk"])
	{
		//Dust fx
		if(floor(image_index) == 3 or floor(image_index) == 6)
		{
			with(instance_create_layer(x, y+6, "Props", oDust))
			{
				image_xscale = random_range(1.2, 1.7);
				image_yscale = image_xscale;
			}
		}
	
		//Sounds
		if(floor(image_index) == 3)
		{
			if(!walkOnce)
			{
				walkOnce = true;
			
				//what material hes on
				if(tilemap_get_at_pixel(_wall_under_map_id, x, y))     walkSound = choose(snWalkSix, snWalkSeven, snWalkEight);
				else if(_floor_map_check) walkSound = choose(snWalkOne, snWalkTwo);
				else if(tilemap_get_at_pixel(_floor_id, x, y))     walkSound = choose(snWalkThree, snWalkFour, snWalkFive);
			
				audio_sound_pitch(walkSound, random_range(0.95, 1.05));
				audio_play_sound(walkSound, 1, false);
			}
		}
		else walkOnce = false;
	}

	//Diffrent Physics on floor
	if(global._floorPhysics)
	{
		if(_floor_map_check) frict = frictMax * 0.3;
		else frict = frictMax;
	}
}