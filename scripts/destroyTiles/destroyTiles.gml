function destroyTiles(xx, yy, pebbleSound = true)
{
	with(oRandomGeneration)
	{	
		var fX = xx div CELL_WIDTH;
		var fY = yy div CELL_HEIGHT;
		
		if(fX >= 4 and fX <= width_-4)
		{
			if(fY >= 4 and fY <= height_-4)
			{
				//Particle
				if(grid_[# fX, fY] != FLOOR)
				{
					repeat(irandom_range(2, 3))
					{
						with(instance_create_layer((fX*CELL_WIDTH)+(CELL_WIDTH/2), (fY*CELL_HEIGHT)+(CELL_HEIGHT/2), "Enemy", oPebble)) _sound = pebbleSound;
					}
				}
				
				//Delete the walls tiles
				for (var _y = fY-3; _y < fY+3; _y++)
				{
					for (var _x = fX-3; _x < fX+3; _x++)
					{
						grid_[# fX, fY] = FLOOR;
						
						if (grid_[# _x, _y] != FLOOR) 
						{
							var _north_tile = grid_[# _x, _y-1] == VOID;
							var _west_tile = grid_[# _x-1, _y] == VOID;
							var _east_tile = grid_[# _x+1, _y] == VOID;
							var _south_tile = grid_[# _x, _y+1] == VOID;
		
							var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
						
							tilemap_set(_wall_map_id, _tile_index, _x, _y);
							if(_tile_index >= 1 && _tile_index <= 8)
							{
								if(_tile_index % 2 == 0 && _tile_index != 8) tilemap_set(_shadow_map_id, 16, _x, _y);
								tilemap_set(_shadow_map_id, _tile_index, _x, _y+1);
							}
							
							if(_tile_index == 16)
							{
								if(grid_[# _x, clamp(_y-2, 0, height_-2)] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
								else if(grid_[# clamp(_x-2, 0, width_-2), _y] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
								else if(grid_[# clamp(_x+2, 0, width_-2), _y] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
								else if(grid_[# _x, clamp(_y+2, 0, height_-2)] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
							}
						}
						else if (grid_[# _x, _y] == FLOOR) 
						{
							tilemap_set(_wall_map_id, 0, _x, _y);
							tilemap_set(_shadow_map_id, 0, _x, _y+1);
						}
					}
				}	
			}
		}
	}
}