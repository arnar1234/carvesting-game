if(countin > 0)
{
	alarm[0] = timin;
	countin -= 1;
	
	destroyTilesCircle(pX, pY, (countMax-countin)*s, pbSound);
}