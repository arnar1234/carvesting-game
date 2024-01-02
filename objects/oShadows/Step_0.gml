//Camera positions
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

if(!surface_exists(shadowSurface))
{
	shadowSurface = surface_create(room_width, room_height);
	surface_set_target(shadowSurface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
else
{
	surface_set_target(shadowSurface);
	draw_clear_alpha(c_white, 0);
	draw_tilemap(shadowTile, -cx, -cy);
	
	
	with(oPlayer) if(global.hp > 0 && state != PLAYER.WALLS) draw_sprite(sPlayerShadow, 0, x-other.cx, y+7-other.cy);
	with(oEnemy) if(!drawDed) draw_sprite(sPlayerShadow, 0, x-other.cx, y+7-other.cy);
	with(oBarrel) draw_sprite(sBarrelShadow, 0, x+_xx-other.cx, y+10+_yy-other.cy);
	with(oChest) draw_sprite(sChestShadow, 0, x-other.cx, y+6-other.cy);
	with(oWeaponPickup) draw_sprite(sPlayerShadow, 0, x-other.cx, y+7-other.cy);
	with(oAmmo) draw_sprite_ext(sAmmoBoxShadow, image_index, x-other.cx, y-other.cy, image_xscale, image_yscale, 0, c_white, image_alpha);
	with(oHealthPotion) draw_sprite_ext(sHealthPotionShadow, image_index, x-other.cx, y+7-other.cy, image_xscale, image_yscale, 0, c_white, image_alpha);
	with(oDestructible) draw_sprite(sPlayerShadow, 0, x-other.cx, y+7-other.cy);
	
	surface_reset_target();
}