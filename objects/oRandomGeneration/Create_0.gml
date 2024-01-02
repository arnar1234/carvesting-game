// Get the tile layer map id
_wall_map_id = layer_tilemap_get_id("Tiles");
_floor_id = layer_tilemap_get_id("Floor");
_floor_map_id = layer_tilemap_get_id("Floor2");
_wall_under_map_id = layer_tilemap_get_id("TilesUnder");
_shadow_map_id = layer_tilemap_get_id("Shadow");
_shadow_id = layer_get_id("Shadows");


//Create Surfaces
instance_create_layer(x, y, "EnemyDown", oEnemyDead);
instance_create_layer(x, y, "Shadows", oShadows);


if(global.weatherSettings != false) instance_create_layer(x, y, "Weather", oWeather);
if(global._fog != false and global.weatherSettings != false) layer_set_visible(layer_get_id("Fog"), true);
if(global._night)
{
	instance_create_layer(x, y, "Night", oNight);
	layer_set_visible(layer_get_id("Shadow"), false);
	layer_set_visible(_shadow_id, false);
}


//----------------WALL GRID-------------


// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 500;

var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
instance_create_layer(_player_start_x, _player_start_y, "Player", oPlayer);

// Choose the direction change odds
var _direction_change_odds = 1;

// Generate the level
repeat (_steps)
{	
	grid_[# _controller_x, _controller_y] = FLOOR;
	grid_[# _controller_x+1, _controller_y+1] = FLOOR;
	
	// Randomize the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) 
	{
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure we don't move outside the room
	if (_controller_x < 8 || _controller_x >= width_ - 9) 
	{
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 9 || _controller_y >= height_ - 9) 
	{
		_controller_y += -_y_direction * 2;
	}
}

// set where floor is
for (var _y = 0; _y < height_-1; _y++) 
{
	for (var _x = 0; _x < width_-1; _x++)
	{
		if (grid_[# _x, _y] != FLOOR)
		{
			var _north_tile = grid_[# _x, clamp(_y-1, 0, width_-1)] == VOID;
			var _west_tile = grid_[# clamp(_x-1, 0, width_-1), _y] == VOID;
			var _east_tile = grid_[# clamp(_x+1, 0, width_-1), _y] == VOID;
			var _south_tile = grid_[# _x, clamp(_y+1, 0, width_-1)] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1)
			{
				grid_[# _x, _y] = FLOOR;
			}
		}
	}
}

// Create the walls tiles
for (var _y = 1; _y < height_-1; _y++)
{
	for (var _x = 1; _x < width_-1; _x++)
	{	
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
			
			if(_tile_index != 16) tilemap_set(_wall_under_map_id, _tile_index, _x, _y);
			else tilemap_set(_wall_under_map_id, irandom_range(16, 19), _x, _y);
			
			if(_tile_index == 16)
			{
				if(grid_[# _x, clamp(_y-2, 0, height_-2)] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
				else if(grid_[# clamp(_x-2, 0, width_-2), _y] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
				else if(grid_[# clamp(_x+2, 0, width_-2), _y] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
				else if(grid_[# _x, clamp(_y+2, 0, height_-2)] == FLOOR) tilemap_set(_wall_map_id, irandom_range(17, 19), _x, _y);
			}
		}
		tilemap_set(_floor_id, irandom_range(1, 3), _x, _y);
	}
}


//fix end of wall bug
for (var _y = 0; _y < height_; _y++)
{
	for (var _x = 0; _x < width_; _x++)
	{
		tilemap_set(_wall_map_id, 16, 0, _y); //Left
		tilemap_set(_wall_map_id, 16, width_-1, _y); //Right
		tilemap_set(_wall_map_id, 16, _x, 0); //Top
		tilemap_set(_wall_map_id, 16, _x, height_-1); //Down
	}
}


//----------------FLOOR GRID-------------

//Floor grid
width_2 = room_width div 32;
height_2 = room_height div 32;
grid_2 = ds_grid_create(width_2, height_2);
ds_grid_set_region(grid_2, 0, 0, width_2, height_2, VOID);

var _controller_x = width_2 div 2;
var _controller_y = height_2 div 2;
var _controller_direction = irandom(3);
var _steps = 400;

// Choose the direction change odds
var _direction_change_odds = 1;

// Generate the level
repeat (_steps)
{	
	grid_2[# _controller_x, _controller_y] = FLOOR;
	
	// Randomize the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) 
	{
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure we don't move outside the room
	if (_controller_x < 2 || _controller_x >= width_2 - 2) 
	{
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 2 || _controller_y >= height_2 - 2) 
	{
		_controller_y += -_y_direction * 2;
	}
}

// set where floor is
for (var _y = 0; _y < height_2-1; _y++) 
{
	for (var _x = 0; _x < width_2-1; _x++)
	{
		if (grid_2[# _x, _y] != FLOOR)
		{
			var _north_tile = grid_2[# _x, clamp(_y-1,0, width_2-1)] == VOID;
			var _west_tile = grid_2[# clamp(_x-1,0, width_2-1), _y] == VOID;
			var _east_tile = grid_2[# clamp(_x+1,0, width_2-1), _y] == VOID;
			var _south_tile = grid_2[# _x, clamp(_y+1,0, width_2-1)] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1)
			{
				grid_2[# _x, _y] = FLOOR;
			}
		}
	}
}

// Create the floor tiles
for (var _y = 1; _y < height_2-1; _y++)
{
	for (var _x = 1; _x < width_2-1; _x++)
	{	
		if (grid_2[# _x, _y] != FLOOR)
		{
			var _north_tile = grid_2[# _x, _y-1] == VOID;
			var _west_tile = grid_2[# _x-1, _y] == VOID;
			var _east_tile = grid_2[# _x+1, _y] == VOID;
			var _south_tile = grid_2[# _x, _y+1] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			
			tilemap_set(_floor_map_id, _tile_index, _x, _y);
		}
	}
}


//----------------PROPS-------------

switch(global._stage)
{
	case 0:
		spawn("Props", oChest, 1, , true, 30);
		spawn("Props", oBarrel, 2);
		spawn("Props", oDestructible, 1, random(2));
		spawn("Props", oDestructible, 1, 2);
		
		spawn("Enemy", oEnemy, 3, 0);
		spawn("Enemy", oEnemy, 1, 1);
		spawn("Enemy", oEnemy, 2, 2);
	break;
	
	case 1:
		spawn("Props", oChest, 5, , true, 30);
		spawn("Props", oBarrel, 2);
		spawn("Props", oDestructible, 1, random(2));
		spawn("Props", oDestructible, 1, 2);
		
		spawn("Enemy", oEnemy, 3, 0);
		spawn("Enemy", oEnemy, 1, 1);
		spawn("Enemy", oEnemy, 2, 3);
	break;
}