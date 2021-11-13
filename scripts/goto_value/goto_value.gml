// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///goto_value(is,to,speed,floor)
///@param is real
///@param to real
///@param speed real

function goto_value(argument0, argument1, argument2 ) {

	var is = argument0;
	var to = argument1;
	var spd = argument2;

	if (is != to)
	{
		var old_sign = sign(is - to)
		is -= old_sign * spd;
		
		if (old_sign != sign(is - to))
		{
			is = to;
		}
	}
	
	return is;
}