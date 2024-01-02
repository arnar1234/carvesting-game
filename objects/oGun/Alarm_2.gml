/// @description Shells
repeat(shell[1])
{
	with(instance_create_layer(x, y, "EnemyDown", oShell))
	{
		sprite_index = other.shell[0];
		direction = other.image_angle + random_range(-20, 20) - 180;
	}
}