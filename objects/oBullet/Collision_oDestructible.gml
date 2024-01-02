with(other)
{
	if(!destroy)
	{
		destructibleDust();
		if(other.fireDamage_)
		{
			repeat(20) fireEffect();
		}
		destroy = true;
		isHit = 8;
	}
}