if(!oPause.pause) && (global.hp > 0)
{
	draw_set_font(fnFont);
	
	//Draw Health
	draw_sprite(sHealth, 0, 5, 157);
	draw_sprite_ext(sPixel, 0, 7, 159, hpRatioGui, 14, 0, c_white, 1);
	if(vigentteD >= 0.6) draw_sprite_ext(sPixel, 0, 7, 159, hpRatio, 14, 0, c_white, 1);
	else draw_sprite_ext(sPixel, 0, 7, 159, hpRatio, 14, 0, c_red, 1);

	draw_text_outline(11, 156, hpString, c_white);
	
	draw_sprite(sHealthPotionGui, healables, 96, 158);
	draw_sprite_ext(sHealthPotionGui_white, 0, 96, 158, 1, 1, 0, c_white, (healtol/60));
	
	draw_sprite(sScore, 0, 5, 3);
	draw_sprite_ext(sPixel, 0, 7, 5, round(scoreBarRatio), 11, 0, c_white, 1);
	draw_sprite_ext(sPixel, 0, 7, 5, round(scoreBarRatioFinal), 11, 0, #98FB98, 1);
	
	draw_set_font(fnFontSmall);
	draw_score_outline(10, 4, "LEVEL " + string(global._level), 1, 1, c_white);
	draw_set_font(fnFont);
	
	draw_score_outline(4, 16, string(round(finalScore))+" PTS", 1*textSize, 1*textSize, color);
	
	draw_set_alpha(1);

	//Bloom vigentte
	if(vigentteA > 0)
	{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sVignette, 0, 0, 0, 1, 1, 0, c_white, vigentteA);
		gpu_set_blendmode(bm_normal);
	}

	//Red Vignette
	if(vigentteD > 0)
	{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sVignetteRed, 0, 0, 0, 1, 1, 0, vignetteColor, vigentteD);
		gpu_set_blendmode(bm_normal);
	}
}
else if(global.hp <= 0)
{
	draw_set_halign(fa_center);
	draw_set_font(fnFont);
	
	draw_set_alpha(pb_a);
	draw_score_outline(320/2, 8+(textSize*14), "NEW PB!", pb_size, pb_size, c_white);
	
	draw_set_alpha(downGui_a);
	draw_score_outline(320/2, 5, string(round(finalScore))+" PTS", textSize, textSize, color);
	draw_text_outline(320/2, 75, "CAUSE OF DEATH: " + causeDeath, c_white);

	draw_set_font(fnFontMenu);
	
	draw_sprite_stretched_ext(sBox, 0, menuY[0], menuY[1], menuY[2], menuY[3], c_white, downGui_a*0.5);
	
	if(gameOverPointer == 0) draw_text_outline(320/2, 143-1, "MENU", c_white);
	else draw_text_outline(320/2, 143, "MENU", c_gray);
	
	draw_set_alpha(1);
}

draw_set_halign(fa_left);