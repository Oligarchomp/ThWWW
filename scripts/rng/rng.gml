///rng(value_high,floored,index)
///@param value real
///@param floored boolean
///@param index real
function rng(argument0,argument1,argument2){
	var rand =  random(argument0);
	if (argument1)
	{
		rand = floor(rand);
	}
	return rand;
}