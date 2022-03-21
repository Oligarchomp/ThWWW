/// @function data_write(file_name,section,key,value);
///@param file_name string
///@param section string
///@param key string
///@param value value
function data_write(file,section,key,value){
	
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