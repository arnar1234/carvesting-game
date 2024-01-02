function largest_string_in_array(_array)
{
	var _largest_string = 0;
	for(var i = 0; i < array_length(_array); i++)
	{
		var _text = _array[i][1];
		
		if(_array[i][0] == "TOGGLE") _text = _array[i][1] + ": ON";
		
		if(_array[i][0] == "SLIDER") _text = _array[i][1] + string_repeat(" ", 7);
		if(_largest_string < string_length(_text)) _largest_string = string_length(_text);
	}
	return _largest_string;
}