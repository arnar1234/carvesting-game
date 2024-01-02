//Input
key_left = oGame.left;
key_right = oGame.right;
key_up = oGame.up;
key_down = oGame.down;

//Die
if(global.hp <= 0) state = PLAYER.DEAD;

switch(state)
{
	case PLAYER.FREE: playerFree(); break;
	case PLAYER.DEAD: playerDead(); break;
	case PLAYER.WALLS: playerWalls(); break;
}

guiCalculations();