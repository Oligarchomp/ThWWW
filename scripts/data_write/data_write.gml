/// @function data_write(file_name,section,key,value);
///@param file_name string
///@param section string
///@param key string
///@param value value
function data_write(argument0,argument1,argument2,argument3){

	var file = argument0;
	var section = argument1;
	var key = argument2;
	var value = argument3;
	
	ini_open(file)
		if(is_string(value))
		{
			ini_write_string(section,key,value)
		}
		else
		{
			ini_write_real(section,key,value);
		}
	ini_close();
}