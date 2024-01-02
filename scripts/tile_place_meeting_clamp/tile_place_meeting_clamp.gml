function tile_place_meeting_clamp(argument0, argument1)
{
    var _tm = oRandomGeneration._wall_map_id;

	var maxWidth = room_width-32;
	var maxHeight = room_height-32;

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, clamp(bbox_left + (argument0 - x), 32, maxWidth), clamp(y, 32, maxHeight)),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, clamp(x, 32, maxWidth), clamp(bbox_top + (argument1 - y), 32, maxHeight)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, clamp(bbox_right + (argument0 - x), 32, maxWidth), clamp(y, 32, maxHeight)),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, clamp(x, 32, maxWidth), clamp(bbox_bottom + (argument1 - y), 32, maxHeight));

	for(var _x = _x1; _x <= _x2; _x++)
	{
		for(var _y = _y1; _y <= _y2; _y++)
		{
			if(tile_get_index(tilemap_get(_tm, _x, _y)))
			{
				return true;
			}
		}
	}

	return false;
}