/// @function data_read(file_name,section,key);
///@param file_name string
///@param section string
///@param key string
function data_read(argument0,argument1,argument2){
	
	var file = argument0;
	var section = argument1;
	var key = argument2;
	
	ini_open(file)
		var data = ini_read_real(section,key,0);
	ini_close();
	return data;
}