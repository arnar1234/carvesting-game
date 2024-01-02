function tileCollisionBounce()
{
	var _wall_map_id = oRandomGeneration._wall_map_id;
	var bbox_side;

	//Horizontal Tiles
	if(hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_side+hsp, bbox_top) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_side+hsp, bbox_bottom) != 0)
	{
		if(hsp > 0) x = x - (x mod 16) + 15 - (bbox_right - x);
		else x = x - (x mod 16) - (bbox_left - x);
		hsp = -hsp;
	}
	x += hsp;
	
	//Vertical Tiles
	if(vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_left, bbox_side+vsp) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_right, bbox_side+vsp) != 0)
	{
		if(vsp > 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
		else y = y - (y mod 16) - (bbox_top - y);
		vsp = -vsp;
	}
	y += vsp;
}