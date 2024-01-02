function in_line_of_sight(xx, yy)
{
	var _distance = 1;
	
	while(!place_meeting(xx, yy, oPlayer))
	{
		var playerDir = point_direction(xx, yy, oPlayer.x ,oPlayer.y);
		xx += lengthdir_x(_distance, playerDir);
		yy += lengthdir_y(_distance, playerDir);
		
		if(tilemap_get_at_pixel(oRandomGeneration._wall_map_id, xx, yy)) return false;
	}
	
	return true;
}