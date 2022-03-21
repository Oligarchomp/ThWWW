/// @function data_read(file_name,section,key);
///@param file_name string
///@param section string
///@param key string
function data_read(file,section,key){
	
	ini_open(file)
		var data = ini_read_real(section,key,0);
	ini_close();
	return data;
}