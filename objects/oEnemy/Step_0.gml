switch(state)
{
	case enemy.alive:
	{
		if(runFromBarrel) && (instance_exists(nearestBarrel))
		{
			var barrelDir = point_direction(x, y, nearestBarrel.x, nearestBarrel.y)-180;
			hsp = lengthdir_x(spd*0.6, barrelDir) + hspKnockback;
			vsp = lengthdir_y(spd*0.6, barrelDir) + vspKnockback;
		}
		else if(distance_to_object(oPlayer) > 20)
		{
			hsp = lengthdir_x(input_magnitude * spd, _input_direction) + hspKnockback;
			vsp = lengthdir_y(input_magnitude * spd, _input_direction) + vspKnockback;
		}
		else
		{
			var playerDir = point_direction(x, y, oPlayer.x, oPlayer.y);
			var playerSpd = oPlayer.spd/2;
			
			hsp = lengthdir_x(playerSpd, playerDir-180) + hspKnockback;
			vsp = lengthdir_y(playerSpd, playerDir-180) + vspKnockback;
		}
		if(hsp != 0 or vsp != 0) tileCollision();
		hspKnockback = lerp(hspKnockback, 0, 0.15);
		vspKnockback = lerp(vspKnockback, 0, 0.15);
		
		//Animation
		if(isHit <= 0)
		{
			if(hsp != 0 or vsp != 0) sprite_index = sprites[1];
			else sprite_index = sprites[0];
		}
		else sprite_index = sprites[2];
		
		//Fire fx
		if(fire > 0) fireEffect();
		
		//iframes
		iframe = clamp(iframe-1, 0, 90);
		
		//Down
		if(hp <= 0)
		{
			white = true;
			
			audio_sound_pitch(snEnemyHit, random_range(0.9, 1.1));
			audio_play_sound(snEnemyHit, 1, false);
			
			screenShake(3, 4);
			
			var randint = irandom_range(500, 2000);
			global._score += randint;
			global._scoreBar += randint;
			
			if(instance_exists(oGun))
			{
				if(global.ammo[oGun.ammoType[0]] <= oGun.ammoMax[oGun.ammoType[0]]*0.2) and (!instance_exists(oAmmo)) instance_create_layer(x, y, "Props", oAmmo);
				else
				{
					var luck = irandom(16);
					if(luck == 0) instance_create_layer(x, y, "Props", oAmmo);
				}
			}
			
			var luck = irandom(6);
			if(luck == 0) instance_create_layer(x, y, "Props", oHealthPotion);
			
			hsp += lengthdir_x(downSpd, deathDir);
			vsp += lengthdir_y(downSpd, deathDir);
			
			state = enemy.down;
			depth = 625;
			
		}
	}
	break;
	
	case enemy.down:
	{
		drawDed = true;
		
		hsp = lerp(hsp, 0, 0.07);
		vsp = lerp(vsp, 0, 0.07);
		
		direction = point_direction(x, y, x+hsp, y+vsp);
		
		tileCollisionBounce();
		
		var hvmag = point_distance(0, 0, hsp, vsp);
		if(hvmag <= 0.05) deadCounter += 1;
		else draw_blood(other.x, other.y, random_range(0.5, 1), random(359), 0.8);
		
		if(deadCounter >= 30) instance_destroy();
	}
	break;
}

//flash
if(state != enemy.down)
{
	if(isHit > 9) white = true;
	else white = false;
}
else
{
	if(isHit == 9) white = false;
	
	if(isHit == 1)
	{
		if(!dieOnce)
		{
			dieOnce = true;
			white = true;
			alarm[11] = 6; //No longer white
		}
	}
}

//Face player
if(oPlayer.x < x) image_xscale = -1;
else image_xscale = 1;

if(isHit > 7)
{
	_xx = irandom_range(-1, 1);
	_yy = irandom_range(-1, 1);
}

//lower isHit
isHit = clamp(isHit-1, 0, 30);
if(isHit <= 0)
{
	_xx = 0;
	_yy = 0;
}