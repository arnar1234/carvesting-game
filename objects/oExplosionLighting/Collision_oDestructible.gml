with(other)
{
	if(!destroy)
	{
		destructibleDust();
		repeat(20) fireEffect();
		destroy = true;
		isHit = 8;
	}
}