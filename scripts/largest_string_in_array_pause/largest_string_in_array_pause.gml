function largest_string_in_array_pause(_array)
{
	var _largest_string = 0;
	for(var i = 0; i < array_length(_array); i++)
	{
		if(_largest_string < string_length(_array[i])) _largest_string = string_length(_array[i]);
	}
	return _largest_string;
}