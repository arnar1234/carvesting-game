function lineDistance(xx, yy)
{
	var _distance = 5;
	
	while(!tilemap_get_at_pixel(oRandomGeneration._wall_map_id, xx, yy))
	{
		xx += lengthdir_x(_distance, image_angle);
		yy += lengthdir_y(_distance, image_angle);
	}
	
	return [xx, yy];
}