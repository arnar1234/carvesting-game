function destroyTilesSmooth(positonX, positonY, size = 1, pebblesound_ = true, count = 2, time = 2)
{
	with(instance_create_depth(0, 0, depth, oDestroyTiles))
	{
		pX = positonX;
		pY = positonY;
		s = size;
		pbSound = pebblesound_;
		countMax = count;
		countin = countMax;
		timin = time;
		alarm[0] = 1;
	}
}