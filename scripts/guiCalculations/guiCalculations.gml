function guiCalculations()
{
	//Draw Gui stuff
	var finalHp = global.hp;
	var finalHpMax = global.hpMax;
	global.hp = clamp(global.hp, 0, finalHpMax); //Clamp the hp

	hpRatio = round(84/(finalHpMax/finalHp));
	hpString = string(finalHp)+"/"+string(finalHpMax);
	hpGui = lerp(hpGui, finalHp, 0.1);
	hpRatioGui = round(84/(finalHpMax/hpGui));
	enemyDamageTick = max(0,abs(enemyDamageTick)-1)*sign(enemyDamageTick);

	//Ratio fix
	if(frac(hpGui) < 0.05) hpGui -= frac(hpGui);
	if(finalHp == hpGui) { if(hpRatio != hpRatioGui) hpRatio = hpRatioGui };


	vigentteA = max(0,abs(vigentteA)-0.01)*sign(vigentteA);
	vigentteD = max(0,abs(vigentteD)-0.1)*sign(vigentteD);

	//Score
	r = lerp(r, 255, 0.05);
	g = lerp(g, 255, 0.05);
	b = lerp(b, 255, 0.05);

	if(global.hp > 0) finalScore = lerp(finalScore, global._score, 0.2);
	else
	{
		if(downGui_a >= 0.6) finalScore = lerp(finalScore, global._score, 0.03);
	}
	finalScoreBar = lerp(finalScoreBar, global._scoreBar, 0.1);

	scoreBarRatio = clamp((global._scoreBar/global._scoreBarMax)*96, 0, 96);
	scoreBarRatioFinal = clamp((finalScoreBar/global._scoreBarMax)*96, 0, 96);

	if(global._scoreBar >= global._scoreBarMax)
	{
		global._level += 1;
		global._scoreBar = 0;
		global._scoreBarMax += 2500;
	
		screenShake(5, 5);
		createScoreText(x, y-6, "Level " + string(global._level));
		audio_play_sound(snLevelUp, 1, false);
	}

	if(round(finalScore) != global._score)
	{
		textSize = 1.2;
		r = 152;
		g = 251;
		b = 152;
	}

	if(r < 255 or g < 255 or b < 255) color = make_color_rgb(r, g, b);
	textSize = lerp(textSize, 1, 0.1);
	
	//Stamina
	if(stamina >= 20) staminaGoto = 0;
	else staminaGoto = 1;
	staminaAlpha = lerp(staminaAlpha, staminaGoto, 0.25);
}