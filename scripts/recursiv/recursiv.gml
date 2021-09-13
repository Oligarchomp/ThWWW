///recursiv(is,to,speed,floor)
///@param is real
///@param to real
///@param speed real
///@param floor real
function recursiv(argument0, argument1, argument2, argument3) {

	var is = argument0;
	var to = argument1;
	var spd = argument2;
	var flr = argument3;

	var is_new = is;
	is_new += ( to - is) / spd;

	if (is_new > to - flr) and (is_new < to + flr)
	{
		return to - is;
	}
	return ( to - is) / spd;

}
