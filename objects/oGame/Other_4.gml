if(room != rMenu)
{
	global._stage = 0;
	
	switch(global._stage)
	{
		case 0:
			global._weather = 2;
			global._night = false;
			global._fog = false;
			global._floorPhysics = false;
			
			//Sprites
			global._background = sSnow;
		break;
		
		case 1:
			global._weather = 1;
			global._night = true;
			global._fog = true;
			global._floorPhysics = false;
			
			//Sprites
			global._background = sSnow;
		break;
	}
	
	 layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global._background);
}