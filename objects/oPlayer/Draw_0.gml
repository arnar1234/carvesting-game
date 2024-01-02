if(vigentteD >= 0.4) gpu_set_fog(true, c_white, 0, 0);
draw_self();
gpu_set_fog(false, c_white, 0, 0);

if(_power == 0 or _power == 4) draw_sprite_ext(sStamina, 20-stamina, x-12, y-12, 1, 1, 0, c_white, staminaAlpha);