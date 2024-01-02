function round_ext(_value, _round)
{
	var answer = round(_value / _round) * _round;
	return answer;
}