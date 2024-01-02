function bulletTileCollision(_sound_ = -1)
{
	var _wall_map_id = oRandomGeneration._wall_map_id;
	var bbox_side;
	
	//Horizontal Tiles
	if(hspeed > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_side+hspeed, bbox_top) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_side+hspeed, bbox_bottom) != 0)
	{
		if(hspeed > 0) x = x - (x mod 16) + 15 - (bbox_right - x);
		else x = x - (x mod 16) - (bbox_left - x);
		hspeed = -hspeed;
		
		if(_sound_ != -1)
		{
			audio_sound_pitch(_sound_, random_range(0.9, 1.1));
			audio_play_sound_at(_sound_, x-oPlayer.x, y-oPlayer.y, 0, 100, 280, 1, 0, 1);
		}
	}
	
	//Vertical Tiles
	if(vspeed > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_left, bbox_side+vspeed) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_right, bbox_side+vspeed) != 0)
	{
		if(vspeed > 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
		else y = y - (y mod 16) - (bbox_top - y);
		vspeed = -vspeed;
		
		if(_sound_ != -1)
		{
			audio_sound_pitch(_sound_, random_range(0.6, 0.7));
			audio_play_sound_at(_sound_, x-oPlayer.x, y-oPlayer.y, 0, 100, 280, 1, 0, 1);
		}
	}
}