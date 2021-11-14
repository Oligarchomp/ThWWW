///recursiv(is,to,speed,floor)
///@param is real
///@param to real
///@param speed real
///@param floor real
function recursiv(is, to, spd, flr) {

	var is_new = is;
	is_new += ( to - is) / spd;

	if (is_new > to - flr) and (is_new < to + flr)
	{
		return to - is;
	}
	return ( to - is) / spd;

}
