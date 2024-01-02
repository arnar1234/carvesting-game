function destroyTilesCircle(positonX, positonY, size = 2, pebblesound_ = true)
{
	var realSize = (size*2)+1;
	for(var _x = -size; _x <= size; _x ++)
	{
		for(var _y = -size; _y <= size; _y ++)
		{
			var distance_squared = sqr(_x) + sqr(_y);
			if(distance_squared < realSize-1)
			{
				var xx = positonX div CELL_WIDTH;
				var yy = positonY div CELL_HEIGHT;
				
				with(oRandomGeneration)
				{
					if(xx+_x >= 4 and xx+_x <= width_-4)
					{
						if(yy+_y >= 4 and yy+_y <= height_-4)
						{
							grid_[# xx+_x, yy+_y] = FLOOR;
							tilemap_set(_wall_map_id, 0, xx+_x, yy+_y);
							tilemap_set(_shadow_map_id, 0, xx+_x, yy+_y+1);
						}
					}
				}
			}

			if(distance_squared >= realSize-1 and distance_squared <= realSize+1)
			{
				var xx = _x*16;
				var yy = _y*16;
			
				destroyTiles(positonX+xx, positonY+yy, pebblesound_);
			}
		}
	}
}