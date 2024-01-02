function createScoreText(_x, _y, string_, color_ = choose(#08F7FE, #09FBD3, #FE53BB, #F5D300))
{
	with(instance_create_depth(_x, _y, -999, oText))
	{
		color = color_;
		_string = string_;
	}
}