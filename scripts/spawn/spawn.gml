function spawn(_layer, _object, _amount, _enemy = -1, _onwall = false, _randomness = width_-5)
{
	var x_ = 5;
	var y_ = 5;
	var tries = 0;
	var done = 0;
	
	while(done < _amount)
	{
		//break so cant softlock
		if(tries > _amount/2)
		{
			show_debug_message("spawning broke");
			break;
		}
		
		//Move the coords
		x_ += 1;
		if(x_ >= width_-5)
		{
			x_ = 5;
			y_ += 1;
		}
		if(y_ >= height_-5) y_ = 5;
		
		//Check if touching the floor
		if(grid_[# x_, y_] == FLOOR) 
		{
			var ex = x_*CELL_WIDTH+CELL_WIDTH/2;
			var ey = y_*CELL_HEIGHT+CELL_HEIGHT/2;
			
			if(_onwall)
			{
				if(grid_[# x_, y_-1] != FLOOR)
				{
					if(point_distance(ex, ey, oPlayer.x, oPlayer.y) > 100) and (irandom(_randomness) == 0)
					{
						if(position_empty(ex, ey))
						{
							done += 1;
							if(_enemy != -1) with(instance_create_layer(ex, ey, _layer, _object)) currentEnemy = _enemy;
							else instance_create_layer(ex, ey, _layer, _object);
						}
						else tries += 1;
					}
				}
			}
			else
			{
				if(point_distance(ex, ey, oPlayer.x, oPlayer.y) > 100) and (irandom(_randomness) == 0)
				{
					if(position_empty(ex, ey))
					{
						done += 1
						if(_enemy != -1) with(instance_create_layer(ex, ey, _layer, _object)) currentEnemy = _enemy;
						else instance_create_layer(ex, ey, _layer, _object);
					}
					else tries += 1;
				}
			}
		}
	}
}