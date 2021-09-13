/// add_zero(string,number_max)
///@param string string
///@param number_max real;
function add_zero(argument0,argument1){

var str = argument0;
while(string_length(str) < argument1)
{
	str = string_insert("0",str,1)
}

return str;
}