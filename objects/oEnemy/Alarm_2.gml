/// @description Change Enemy
var finalEnemy = enemyStats[currentEnemy];

enemyType = finalEnemy[? "Enemy Type"];
hp = finalEnemy[? "Hp"];
spd = finalEnemy[? "Speed"];
sprites = finalEnemy[? "Sprites"];
walkingStart = finalEnemy[? "Walking Start"];
walkingStop = finalEnemy[? "Walking Stop"];
enemyWeapon = finalEnemy[? "Weapon"];


id_ = -1;
//Spawn Gun
with(instance_create_depth(x,y,depth-1,oEnemyGun))
{
	weaponCurrent = other.enemyWeapon;
	_id = other.id;
	other.id_ = _id;
}