function screenShake(_magnitude, _length)
{
	with(oCamera)
	{
		if(_magnitude > shake_remain)
		{
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _length;
		}
	}
}