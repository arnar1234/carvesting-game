function takeDamage(damage_, heal_ = false, healcooldown_ = 30)
{
	if(heal_)
	{
		with(oPlayer)
		{
			if(global.hp < global.hpMax) && (global.hp > 0)
			{
				global.hp += damage_;
				vigentteD = 2;
				vignetteColor = c_green;
			}
		}
	}
	else
	{
		with(oPlayer)
		{
			if(global.hp > 0)
			{
				global.hp -= damage_;
				vigentteD = 1;
				vignetteColor = c_red;
				if(healcooldown_ != 0) healcooldown = healcooldown_;
				
				screenShake(5, 3);
				audio_sound_pitch(player[$ global.currentPlayer][$ "hurtFx"], random_range(0.95, 1.1));
				audio_play_sound(player[$ global.currentPlayer][$ "hurtFx"], 1, false);
				
				if(player[$ global.currentPlayer][$ "blood"] == 1)
				{
					enemyDust(deathDir);
					draw_blood(x, y, random_range(0.5, 0.8), random(359), 0.8);
				}
				else if(player[$ global.currentPlayer][$ "blood"] == 2) robDust(deathDir);
			}
		}
	}
}