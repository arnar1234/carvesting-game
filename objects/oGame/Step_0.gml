/// @description Input
if(gamepad_is_connected(0)) connected = true;
else connected = false;

if(connected)
{
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	
	var _x = gamepad_axis_value(0, gp_axislh);
	var _y = gamepad_axis_value(0, gp_axislv);
			
	dir = point_direction(0, 0, _x, _y);
	mag = clamp(point_distance(0, 0, _x, _y)*2, 0, 1);
	horiMag = clamp(point_distance(0, 0, _x, 0)*2, 0, 1);
	
	//Player
	heal = gamepad_button_check(0, gp_face2);
	healPressed = gamepad_button_check_pressed(0, gp_face2);
	healReleased = gamepad_button_check_released(0, gp_face2);
	
	//Weapon
	switchW = gamepad_button_check_pressed(0, gp_face1);
	pickup = gamepad_button_check_pressed(0, gp_face3);
	
	shoot = gamepad_button_check(0, gp_shoulderrb);
	shootPressed = gamepad_button_check_pressed(0, gp_shoulderrb);
	shootReleased = gamepad_button_check_released(0, gp_shoulderrb);
	
	secondaryPressed = gamepad_button_check_pressed(0, gp_shoulderlb);
	
	//Aim direction
	var aimX = gamepad_axis_value(0, gp_axisrh);
	var aimY = gamepad_axis_value(0, gp_axisrv);

	aimMag = clamp(point_distance(0, 0, aimX, aimY), 0, 1);
	if(aimMag > 0.1) aimDir = point_direction(0, 0, aimX, aimY);
	
	
	//Menu
	menuBack = gamepad_button_check_pressed(0, gp_face2);
	menuAccept = gamepad_button_check_pressed(0, gp_face1);
	menuPause = gamepad_button_check_pressed(0, gp_start);
	menuHorizontal = sign(gamepad_axis_value(0, gp_axislh));
	
	if(_y <= -0.3)
	{
		if(!menuOnce)
		{
			menuOnce = true;
			menuUp = true;
		}
		else menuUp = false;
	}
	
	if(_y >= 0.3)
	{
		if(!menuOnce)
		{
			menuOnce = true;
			menuDown = true;
		}
		else menuDown = false;
	}
	
	if(_y == 0)
	{
		menuOnce = false;
		menuUp = false;
		menuDown = false
	}
}
else
{
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	
	dir = point_direction(0, 0, right-left, down-up);
	
	//Player
	heal = keyboard_check(ord("F"));
	healPressed = keyboard_check_pressed(ord("F"));
	healReleased = keyboard_check_released(ord("F"));
	
	//Weapon
	switchW = keyboard_check_pressed(vk_space);
	pickup = keyboard_check_pressed(ord("E"));
	
	shoot = mouse_check_button(mb_left);
	shootPressed = mouse_check_button_pressed(mb_left);
	shootReleased = mouse_check_button_released(mb_left);
	
	secondaryPressed = mouse_check_button_pressed(mb_right);
	
	//Aim direction
	if(instance_exists(oGun)) aimDir = point_direction(oGun.x, oGun.y, mouse_x, mouse_y);
	
	
	//Menu
	menuBack = keyboard_check_pressed(vk_escape) or mouse_check_button_pressed(mb_right);
	menuAccept = mouse_check_button_pressed(mb_left);
	menuPause = keyboard_check_pressed(vk_escape);
}