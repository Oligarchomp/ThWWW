// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///goto_value(is,to,speed,floor)
///@param is real
///@param to real
///@param speed real

function goto_value(is,to,spd) {


	if (is == to) return is;
	if (is > to){
		is -= spd;
		is = is < to ? to: is;
	} else {
		is += spd;
		is = is > to ? to: is;
	}
	return is;
	
	
	/*
	var old_sign = sign(is - to)
	is -= old_sign * spd;
		
	is = old_sign != sign(is - to) ? to : is; 
	
	return is;
	*/
}