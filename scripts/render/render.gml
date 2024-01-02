function render()
{
	instance_deactivate_object(oWeaponPickup);
	instance_deactivate_object(oChest);
	
	instance_activate_region(oCamera.x-200, oCamera.y-112, 400, 225, true);
}