function playerDead()
{
	if(!dieOnce)
	{
		dieOnce = true;
		hsp += lengthdir_x(downSpd, deathDir);
		vsp += lengthdir_y(downSpd, deathDir);
		
		hspKnockback = 0;
		vspKnockback = 0;
		
		finalScore = 0;
		currentscore = global._score;
		if(global._score > global.pb)
		{
			newPb = true;
			global.pb = global._score;
			
			instance_create_depth(0, 0, -9999, oFireworkLauncher);
		}
		
		//Stop music
		audio_stop_sound(snMusic);
		audio_stop_sound(snMusic2);
		audio_stop_sound(snMusic3);
		
		if(!oGun.disable)
		{
			stopJiter = true;
			with(instance_create_layer(x, y, "Props", oGunDead))
			{
				var dir = other.deathDir + irandom_range(-10, 10);
				var spd_ = other.downSpd + random_range(0 , 1.75);
				hsp += lengthdir_x(spd_, dir);
				vsp += lengthdir_y(spd_, dir);
				sprite_index = asset_get_index(sprite_get_name(oGun.sprite_index) + "Center");
			}
		}
		
		instance_destroy(oGun);
		
		//hat
		if(player[$ global.currentPlayer][$ "hat"] != -1)
		{
			with(instance_create_layer(x, y, "Props", oGunDead))
			{
				var dir = other.deathDir + irandom_range(-50, 50);
				var spd_ = other.downSpd + random_range(1 , 2.5);
				hsp += lengthdir_x(spd_, dir);
				vsp += lengthdir_y(spd_, dir);
				sprite_index = other.player[$ global.currentPlayer][$ "hat"];
			}
		}
	}
	
	global._score = currentscore;
	
	if(newPb)
	{
		pb_size = sine_wave(current_time / 1000, 2, 0.05, 1);
		if(gameOverCurrent == 0) pb_a = clamp(pb_a+0.02, pb_a-1, 1.3);
		else pb_a = clamp(pb_a-0.2, pb_a-1, 1.3);
	}
	if(gameOverCurrent == 0) downGui_a = clamp(downGui_a+0.02, downGui_a-1, 1.3);
	else downGui_a = clamp(downGui_a-0.05, downGui_a-0.1, 1);
	sprite_index = sprites[$ "down"];
	image_xscale = -1;
	if(sqrt(hsp*hsp + vsp*vsp) > 0.3) image_angle = point_direction(x+hsp, y+vsp, x, y);
	
	if(stopJiter) //Check if player is in the wall to fix jitteryness bug
	{
		tileCollisionBounce();
		hsp = lerp(hsp, 0, 0.07);
		vsp = lerp(vsp, 0, 0.07);
	}
	else
	{
		hsp = 0;
		vsp = 0;
	}
	
	//Blood
	if(oPlayer.player[$ global.currentPlayer][$ "blood"] == 1)
	{
		var hvmag = point_distance(0, 0, hsp, vsp);
		if(hvmag > 0.05) draw_blood(x, y, random_range(0.5, 1), random(359), 0.8);
	}
	
	
	//Game over menu
	if(oGame.menuAccept) && (gameOverPointer == 0) && (gameOverCurrent == 0)
	{
		audio_play_sound(snMenuClick, 1, false);
		instance_create_depth(0, 0, -99, oGameOverEffect);
		gameOverCurrent = 1;
	}
	
	if(!oGame.connected)
	{
		if(gameOverPointer != oldGameOverPointer) audio_play_sound(snMenuMove, 1, false);
		oldGameOverPointer = gameOverPointer;
		
		var mouse_x_gui = device_mouse_x_to_gui(0);
		var mouse_y_gui = device_mouse_y_to_gui(0);
		
		if(mouse_x_gui > 115 and mouse_x_gui < 207) && (mouse_y_gui >= 144 and mouse_y_gui < 175) gameOverPointer = 0;
		else gameOverPointer = -1;
	}
	else gameOverPointer = 0;
}